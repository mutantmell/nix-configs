{ pkgs, lib, ... }:

let
  wee-pass = builtins.readFile (./keys + "/weechat.pass");
  mkService = name: {
    "weechat-${name}" = {
      description = "weechat - ${name}";
      wantedBy = [ "multi-user.target" ];
      path = [ pkgs.weechat pkgs.tmux pkgs.openssl ];
      preStart = ''
        chown -R ${name} /var/lib/weechat-${name}
      '';
      script = ''
        tmux new-session -d -s ${name} weechat
      '';
      preStop = ''
        tmux kill-session -t ${name}
      '';
      serviceConfig = {
        User = name;
        KillMode = "process";
        Restart = "always";
        WorkingDirectory = "/var/lib/weechat-${name}";
        RemainAfterExit = "yes";
      };
    };
  };
  mkUser = name: {
    "${name}" = {
      createHome = true;
      home = "/var/lib/weechat-${name}";
      isNormalUser = true;
    };
  };
  configs = [ "relay" ];
in {
  systemd.services = lib.foldl' (state: name: state // (mkService name)) {} configs;
  users.extraUsers = lib.foldl' (state: name: state // (mkUser name)) {} configs;
  environment.systemPackages = [ pkgs.tmux pkgs.openssl pkgs.weechat ];

}
