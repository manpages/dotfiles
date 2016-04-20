{ ... }:
{ ... }:
{
  services.cron = {
    enable = true;
    cronFiles = [ "/services/cron.conf" ];
  };
}
