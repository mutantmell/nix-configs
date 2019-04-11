{ config, pkgs, ... }:

{
  imports = [
    ./acme.nix
    ./irc/bitlbee.nix
    ./irc/weechat.nix
  ];

  networking.firewall.allowedTCPPorts = [ 80 443 9001 ];

  services.openssh.enable = true;
  services.openssh.ports = [ 32322 ];

}
