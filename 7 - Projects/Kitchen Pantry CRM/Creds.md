
● krwhynot@Revent1:~$ sudo -u postgres psql
[sudo] password for krwhynot:
could not change directory to "/home/krwhynot": Permission denied
psql (14.18 (Ubuntu 14.18-0ubuntu0.22.04.1))
Type "help" for help.

DATABASE foodservice_crm;

USER crm_user 
PASSWORD '+LFy1QCCpmSlC9Fv';


📋 Deployment Summary

  ✅ Azure Resources Created:
  - Resource Group: kitchenpantry-crm-rg (Central US)
  - PostgreSQL Server: foodservice-crm-db-1750338802.postgres.database.azure.com
  - Database: foodservice_crm
  - App Service Plan: kitchenpantry-crm-plan (Linux B1)
  - App Service: kitchenpantry-crm-app-1750338802.azurewebsites.net

  🔗 Your Application URLs:

  - App Service URL: https://kitchenpantry-crm-app-1750338802.azurewebsites.net
  - Admin Panel URL: https://kitchenpantry-crm-app-1750338802.azurewebsites.net/admin

  🔐 Database Credentials:

  - Host: foodservice-crm-db-1750338802.postgres.database.azure.com
  - Database: foodservice_crm
  - Username: crmadmin
  - Password: CRM@Admin123!