
● krwhynot@Revent1:~$ sudo -u postgres psql
[sudo] password for krwhynot:
could not change directory to "/home/krwhynot": Permission denied
psql (14.18 (Ubuntu 14.18-0ubuntu0.22.04.1))
Type "help" for help.

DATABASE foodservice_crm;

USER crm_user 
PASSWORD '+LFy1QCCpmSlC9Fv';
### Azure Resource Cheatsheet for PantryCRM

**1. Azure General Information:**

- **Subscription ID:** 
    
    ```
    df8fefaa-16a0-47da-ace7-6eab8b1919cf
    ```
    
     (From your output)
- **Resource Group Name:** 
    
    ```
    kitchenpantry-crm-rg
    ```
    
- **Location:** 
    
    ```
    centralus
    ```
    

**2. Azure PostgreSQL Flexible Server:**

- **Server Name:** 
    
    ```
    pantrycrm-pgsql-server
    ```
    
- **Admin Username:** 
    
    ```
    crm_admin
    ```
    
- **Admin Password:** 
    
    ```
    P@sswOrd12345!
    ```
    
     **(IMPORTANT: Use the actual strong password you set during creation or will set shortly. This is a placeholder.)**
- **Database Version:** 
    
    ```
    14
    ```
    
- **SKU:** 
    
    ```
    Standard_B1ms
    ```
    
     (Burstable)
- **Public Access:** 
    
    ```
    0.0.0.0
    ```
    
     (Allows all IPs - **to be restricted later for security**)
    - To get the fully qualified domain name (FQDN) for your server after creation, you can use:
        
        bash
        
        az postgres flexible-server show --resource-group kitchenpantry-crm-rg --name pantrycrm-pgsql-server --query fullyQualifiedDomainName -o tsv
        
    - The default database created is usually named 
        
        ```
        flexibleserverdb
        ```
        
        . You'll likely want to create a specific database for your CRM (e.g., 
        
        ```
        pantry_crm_prod
        ```
        
        ) using a tool like 
        
        ```
        psql
        ```
        
         or pgAdmin once the server is up.

**3. Azure App Service Plan:**

- **Plan Name:** 
    
    ```
    pantrycrm-app-plan
    ```
    
- **Operating System:** Linux
- **SKU:** 
    
    ```
    B1
    ```
    
     (Basic)

**4. Azure App Service (Web App):**

- **App Name:** 
    
    ```
    pantrycrm-app
    ```
    
- **Default Hostname:** 
    
    ```
    pantrycrm-app.azurewebsites.net
    ```
    
- **Runtime:** PHP 8.2
- **SCM (Kudu) Hostname:** 
    
    ```
    pantrycrm-app.scm.azurewebsites.net
    ```
    
- **Outbound IP Addresses (for DB firewall rules, partial list from your output):** 
    
    ```
    20.83.0.182, 20.83.0.220, 20.83.0.229, 20.83.1.106, 20.83.1.118, 20.83.2.171, 20.118.40.12
    ```
    
     (You should get the full list from the Azure portal under your App Service's "Properties" blade for "Additional Outbound IP Addresses" if needed for more restrictive firewall rules).