# Step 1: Create resource group
az group create --name rg-kitchen-pantry-crm --location centralus

# Step 2: Create SQL Server
az sql server create --name kitchenpantrycrm-server --resource-group rg-kitchen-pantry-crm --location centralus --admin-user crm_admin --admin-password "YourSecurePassword123!"

# Step 3: Create database
az sql db create --resource-group rg-kitchen-pantry-crm --server kitchenpantrycrm-server --name kitchen-pantry-crm --service-objective Basic

# Step 4: Configure firewall
az sql server firewall-rule create --resource-group rg-kitchen-pantry-crm --server kitchenpantrycrm-server --name AllowLocalIP --start-ip-address 0.0.0.0 --end-ip-address 255.255.255.255

Server=tcp:kitchenpantrycrm-server.database.windows.net,1433;Initial Catalog=kitchen-pantry-crm;Persist Security Info=False;User ID=crm_admin;Password=YourSecurePassword123!;MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;

Server=tcp:kitchenpantrycrm-server.database.windows.net,1433;Initial Catalog=kitchen-pantry-crm;Persist Security Info=False;User ID=crm_admin;Password={your_password};MultipleActiveResultSets=False;Encrypt=True;TrustServerCertificate=False;Connection Timeout=30;