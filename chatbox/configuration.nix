{ config, pkgs, ... }:

{
  imports = [
    <nixpkgs/nixos/modules/installer/virtualbox-demo.nix>
    ./irc/bitlbee.nix
    ./irc/weechat.nix
  ];

  networking.firewall.allowedTCPPorts = [ 9001 ];

}
