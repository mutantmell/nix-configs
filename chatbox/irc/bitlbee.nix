{ pkgs, lib, ...}:

{
  services.bitlbee = {
    enable = true;
    portNumber = 6667;
    plugins = [
      pkgs.bitlbee-facebook
      pkgs.bitlbee-steam
      # all plugins: `nix-env -qaP | grep bitlbee-`
    ];
  };
}
