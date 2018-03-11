{ config, pkgs, ... }:

{
  imports = [
    ./irc/bitlbee.nix
    ./irc/weechat.nix
  ];

  networking.firewall.allowedTCPPorts = [ 9001 ];

}
