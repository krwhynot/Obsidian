
● krwhynot@Revent1:~$ sudo -u postgres psql
[sudo] password for krwhynot:
could not change directory to "/home/krwhynot": Permission denied
psql (14.18 (Ubuntu 14.18-0ubuntu0.22.04.1))
Type "help" for help.

DATABASE foodservice_crm;

USER crm_user 
PASSWORD '+LFy1QCCpmSlC9Fv';


az postgres flexible-server create \
  --resource-group kitchenpantry-crm-rg \
  --name pantrycrm-pgsql-server \
  --location centralus \
  --admin-user crm_admin \
  --admin-password "P@sswOrd12345!" \
  --sku-name Standard_B1ms \
  --tier Burstable \
  --public-access 0.0.0.0 \
  --storage-size 32 \
  --version 14 \
  --backup-retention-days 7