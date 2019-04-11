{ pkgs, lib, ...}:

{
  services.nginx.enable = true;
  services.nginx.virtualHosts."ocean.helveticastandard.com" = {
    forceSSL = true;
    enableACME = true;
    root = "/var/www";
  };
}
