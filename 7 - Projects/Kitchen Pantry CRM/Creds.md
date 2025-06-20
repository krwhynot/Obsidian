
● krwhynot@Revent1:~$ sudo -u postgres psql
[sudo] password for krwhynot:
could not change directory to "/home/krwhynot": Permission denied
psql (14.18 (Ubuntu 14.18-0ubuntu0.22.04.1))
Type "help" for help.

postgres=#
postgres=# CREATE DATABASE foodservice_crm;
CREATE USER crm_user WITHERROR:  database "foodservice_crm" already exists
postgres=# CREATE USER crm_user WITH PASSWORD '+LFy1QCCpmSlC9Fv';
RANT ALL PRIVILEGES ON DATABASE foodservice_crm TO crm_user;
\qCREATE ROLE
postgres=# GRANT ALL PRIVILEGES ON DATABASE foodservice_crm TO crm_user;
GRANT
postgres=# \q
krwhynot@Revent1:~$


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