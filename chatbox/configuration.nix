{ config, pkgs, ... }:

{
  imports = [
    ./irc/bitlbee.nix
    ./irc/weechat.nix
  ];

  networking.firewall.allowedTCPPorts = [ 9001 ];

  services.openssh.enable = true;
  services.openssh.ports = [ 32322 ];

}
