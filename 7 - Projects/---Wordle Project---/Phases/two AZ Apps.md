I need to create a comprehensive guide for setting up Azure resources for the Wordle Game project based on 2025 industry standards. The project includes a React frontend, Node.js backend, and Cosmos DB for word storage. I'll use web search to verify current best practices.

# Complete Azure Resource Creation Guide for Wordle Game (2025 Standards)

This guide follows the latest 2025 cloud architecture principles, incorporating serverless approaches, security best practices, and cost optimization techniques based on current Azure patterns.

## Phase 1: Environment Setup and Resource Group

### 1. Create Resource Group

1. **Sign in to Azure Portal**: [https://portal.azure.com](https://portal.azure.com/)
    
2. **Create Resource Group**:
    
    - Click **≡ Menu** > **Resource groups** > **+ Create**
    - **Basics** tab:
        - **Subscription**: Your subscription
        - **Resource group**: `wordle-game-rg`
        - **Region**: Select a region close to your users (e.g., East US 2)
    - Click **Review + create** > **Create**
3. **Set up Tags for Cost Management** (2025 best practice):
    
    - In your new resource group, select **Tags**
    - Add:
        - `Environment: Development`
        - `Project: WordleGame`
        - `Owner: YourName`
    - Click **Apply**

## Phase 2: Database Setup with Cosmos DB

### 1. Create Cosmos DB Account

1. **Navigate to Azure Portal Home** > **+ Create a resource**
2. **Search for "Cosmos DB"** > Select **Azure Cosmos DB**
3. **Select Azure Cosmos DB for MongoDB** (API choice)
4. **Create** form:
    - **Subscription**: Your subscription
    - **Resource Group**: `wordle-game-rg`
    - **Account Name**: `wordle-cosmos-db` (must be globally unique)
    - **Location**: Same region as your resource group
    - **Capacity mode**: **Serverless** (optimal for variable workloads, 2025 best practice)
    - **Availability Zones**: **Enable** (for high availability)
    - **Backup Policy**: **Periodic**
    - **Backup Storage Redundancy**: **Geo-redundant**
    - **Connectivity method**: **Public endpoint (selected networks)**
    - **Minimum TLS Version**: **TLS 1.2**
5. Click **Review + create** > **Create**

### 2. Create Database and Collection

1. **Navigate to your new Cosmos DB account**
2. In the left menu, select **Data Explorer**
3. Click **New Database**:
    - **Database id**: `wordleDb`
    - **Provision throughput**: Unchecked
    - Click **OK**
4. Select your new database in the tree view
5. Click **New Collection**:
    - **Database id**: `wordleDb` (should be pre-selected)
    - **Collection id**: `words`
    - **Shard key**: `word` (important for performance)
    - **Unsharded**: Selected (best for this data size)
    - Click **OK**

### 3. Create Index for Performance (2025 Best Practice)

1. In **Data Explorer**, expand your database and collection
2. Click **Scale & Settings**
3. In the **Indexing Policy** section, add this JSON configuration:
    
    ```json
    {  "indexingMode": "consistent",  "automatic": true,  "includedPaths": [    {      "path": "/word/?",      "indexes": [        {          "kind": "Range",          "dataType": "String",          "precision": -1        }      ]    },    {      "path": "/lastUsed/?",      "indexes": [        {          "kind": "Range",          "dataType": "Number",          "precision": -1        }      ]    }  ]}
    ```
    
4. Click **Save**

## Phase 3: Security and Secret Management with Key Vault

### 1. Create Key Vault

1. Navigate to **+ Create a resource** > Search for **Key Vault**
    
2. Click **Create** on the Key Vault card
    
3. **Basics** tab:
    
    - **Subscription**: Your subscription
    - **Resource group**: `wordle-game-rg`
    - **Key vault name**: `wordle-key-vault` (must be globally unique)
    - **Region**: Same as resource group
    - **Pricing tier**: **Standard**
    - **Days to retain deleted vaults**: `90`
4. **Access configuration** tab:
    
    - **Permission model**: **Azure role-based access control (RBAC)** (2025 security best practice)
    - Leave the checkboxes unchecked
5. **Networking** tab:
    
    - **Connectivity method**: **Public endpoint (selected networks)**
    - **Allow trusted Microsoft services**: **Yes**
    - **Firewall**: Allow your IP address
6. Click **Review + create** > **Create**
    

### 2. Configure Access Control for Key Vault

1. Navigate to your new Key Vault
2. Select **Access control (IAM)** from left menu
3. Click **+ Add** > **Add role assignment**
4. Select **Key Vault Administrator** role
5. Click **Next** > **+ Select members**
6. Find and select your user account
7. Click **Select** > **Review + assign** > **Assign**
8. Wait a few minutes for role assignment to propagate

### 3. Store Database Connection String

1. Navigate to your Cosmos DB account
2. In left menu, select **Connection String**
3. Copy the **Primary Connection String**
4. Navigate to your Key Vault
5. In left menu, select **Secrets**
6. Click **+ Generate/Import**
7. Fill in:
    - **Name**: `CosmosDBConnectionString`
    - **Value**: Paste your connection string
    - Leave other settings as default
8. Click **Create**

## Phase 4: Backend API Setup with App Service

### 1. Create App Service Plan

1. Navigate to **+ Create a resource** > Search for **App Service Plan**
2. Click **Create**
3. Fill in:
    - **Subscription**: Your subscription
    - **Resource Group**: `wordle-game-rg`
    - **Name**: `wordle-api-plan`
    - **Operating System**: **Linux**
    - **Region**: Same as resource group
    - **Pricing tier**: Click **Change size** > Select **Basic B1** (sufficient for development)
4. Click **Review + create** > **Create**

### 2. Create Web App for Backend API

1. Navigate to **+ Create a resource** > Search for **Web App**
    
2. Click **Create**
    
3. **Basics** tab:
    
    - **Subscription**: Your subscription
    - **Resource Group**: `wordle-game-rg`
    - **Name**: `wordle-game-api` (must be globally unique)
    - **Publish**: **Code**
    - **Runtime stack**: **Node 20 LTS**
    - **Operating System**: **Linux**
    - **Region**: Same as resource group
    - **App Service Plan**: Select the plan you created
4. **Monitoring** tab:
    
    - **Enable Application Insights**: **Yes**
    - Click **Create new** or use existing if you have one
    - **Name**: `wordle-app-insights`
    - Click **OK**
5. **Deployment** tab:
    
    - **Enable continuous deployment**: **Enable**
    - **GitHub account**: Connect your account
    - **Organization**: Your GitHub organization/username
    - **Repository**: Your wordle-game repository
    - **Branch**: `main` (or your primary branch)
6. Click **Review + create** > **Create**
    

### 3. Configure App Service Environment Variables

1. After deployment, navigate to your App Service
    
2. In left menu, select **Configuration**
    
3. Click **+ New application setting** for each of these:
    
    a. Add Cosmos DB Connection String using Key Vault:
    
    - **Name**: `COSMOS_DB_CONNECTION_STRING`
    - Enable **Key vault reference**
        - **Key vault**: Select `wordle-key-vault`
        - **Secret**: Select `CosmosDBConnectionString`
    - Click **OK**
    
    b. Add Database Name:
    
    - **Name**: `COSMOS_DB_NAME`
    - **Value**: `wordleDb`
    - Click **OK**
    
    c. Add Environment:
    
    - **Name**: `NODE_ENV`
    - **Value**: `production`
    - Click **OK**
4. Click **Save** at the top
    

### 4. Enable Managed Identity and Key Vault Access

1. Navigate to your App Service
    
2. In left menu, select **Identity**
    
3. Under **System assigned** tab, switch **Status** to **On**
    
4. Click **Save** > **Yes** to confirm
    
5. Copy the **Object (principal) ID**
    
6. Navigate to your Key Vault
    
7. In left menu, select **Access control (IAM)**
    
8. Click **+ Add** > **Add role assignment**
    
9. Select **Key Vault Secrets User** role
    
10. Click **Next** > **+ Select members**
    
11. Paste the Object ID in the search box
    
12. Select your App Service's managed identity
    
13. Click **Select** > **Review + assign** > **Assign**
    

## Phase 5: Frontend Setup with Static Web Apps

### 1. Create Static Web App (2025 Best Practice for Frontend)

1. Navigate to **+ Create a resource** > Search for **Static Web App**
2. Click **Create**
3. Fill in:
    - **Subscription**: Your subscription
    - **Resource Group**: `wordle-game-rg`
    - **Name**: `wordle-game-frontend`
    - **Hosting plan**: **Standard**
    - **Region**: Choose closest to your users
    - **Source**: Select your source control provider
        - Authenticate if needed
        - **Organization**: Your GitHub organization
        - **Repository**: Your wordle-game repository
        - **Branch**: `main` (or your primary branch)
    - **Build Details**:
        - **Build Preset**: **React**
        - **App location**: `packages/client`
        - **Output location**: `dist`
        - **API location**: Leave empty
4. Click **Review + create** > **Create**

### 2. Configure Static Web App Settings

1. Create a file in your repository at `packages/client/staticwebapp.config.json`:

```json
{
  "navigationFallback": {
    "rewrite": "/index.html",
    "exclude": ["*.{css,js,ico,jpg,png,svg}", "/assets/*"]
  },
  "routes": [
    {
      "route": "/api/*",
      "allowedRoles": ["anonymous"],
      "backendUri": "https://wordle-game-api.azurewebsites.net/api"
    }
  ],
  "responseOverrides": {
    "404": {
      "rewrite": "/index.html",
      "statusCode": 200
    }
  },
  "globalHeaders": {
    "Content-Security-Policy": "default-src 'self'; script-src 'self'; style-src 'self' 'unsafe-inline'; img-src 'self' data:; font-src 'self';",
    "X-Content-Type-Options": "nosniff",
    "X-Frame-Options": "DENY",
    "Referrer-Policy": "strict-origin-when-cross-origin"
  },
  "mimeTypes": {
    ".json": "application/json"
  }
}
```

2. Commit and push this file to your repository
3. The Static Web App will automatically redeploy with this configuration

## Phase 6: Monitoring and Observability Setup

### 1. Configure Application Insights Dashboard

1. Navigate to **Application Insights** resource created during App Service setup
2. In left menu, select **Dashboard**
3. Click **+ New dashboard**
4. Add performance monitoring tiles:
    - API response time
    - Failure rate
    - Server exceptions
    - Dependency calls (Cosmos DB)
5. Name the dashboard `Wordle Game Monitoring` and save

### 2. Set Up Alerts for Critical Metrics

1. In **Application Insights**, select **Alerts**
2. Click **+ Create** > **Alert rule**
3. Add these recommended alerts:
    - API response time > 1 second
    - Error rate > 5%
    - Cosmos DB query duration > 500ms
4. Configure notification channels (email, SMS, etc.)

### 3. Enable Log Analytics

1. In **Application Insights**, select **Logs**
2. Click **+ New query**
3. Configure a query workspace with:
    - API performance logs
    - Database query performance
    - User session data
4. Save queries for easy access

## Phase 7: Word Database Import Setup

### 1. Prepare Import Script Environment

1. Create a directory on your local machine:
    
    ```powershell
    mkdir wordle-db-import
    cd wordle-db-import
    ```
    
2. Initialize a Node.js project:
    
    ```powershell
    npm init -y
    ```
    
3. Install dependencies:
    
    ```powershell
    npm install mongodb dotenv fs
    ```
    

### 2. Create Required Files

1. Create `.env` file:
    
    ```powershell
    $env = @"
    COSMOS_DB_CONNECTION_STRING=your_connection_string_here
    "@
    $env | Out-File -FilePath ".env" -Encoding utf8
    ```
    
2. Copy and paste your word list into `words.txt` (one word per line)
    
3. Create `import-words.js` script file:
    
    ```powershell
    $script = @'
    // import-words.js
    require('dotenv').config();
    const fs = require('fs');
    const { MongoClient } = require('mongodb');
    
    // Configuration
    const connectionString = process.env.COSMOS_DB_CONNECTION_STRING;
    if (!connectionString) {
      console.error('Missing COSMOS_DB_CONNECTION_STRING in .env file');
      process.exit(1);
    }
    const dbName = 'wordleDb';
    const collectionName = 'words';
    const wordsFilePath = './words.txt';
    
    async function importWords() {
      console.log('Starting word import process...');
      let client;
    
      try {
        // Read words file (assuming one word per line)
        if (!fs.existsSync(wordsFilePath)) {
          console.error(`Error: File not found at ${wordsFilePath}`);
          process.exit(1);
        }
    
        console.log(`Reading words from ${wordsFilePath}...`);
        const fileContent = fs.readFileSync(wordsFilePath, 'utf8');
        const allWords = fileContent.split(/\r?\n/);
        
        // Filter valid 5-letter words (only letters, exactly 5 characters)
        const words = allWords
          .map(word => word.trim())
          .filter(word => word.length === 5 && /^[a-zA-Z]+$/.test(word));
        
        console.log(`Found ${words.length} valid 5-letter words out of ${allWords.length} total lines`);
        
        if (words.length === 0) {
          console.error('No valid words found to import. Check your words.txt file.');
          process.exit(1);
        }
        
        // Connect to MongoDB
        console.log('Connecting to Cosmos DB...');
        client = new MongoClient(connectionString);
        await client.connect();
        console.log('Connected to database successfully');
        
        const db = client.db(dbName);
        const collection = db.collection(collectionName);
        
        // Check if collection already has data
        const count = await collection.countDocuments();
        if (count > 0) {
          console.log(`Warning: Collection already has ${count} documents.`);
          console.log('Do you want to proceed with adding more words? (y/n)');
          
          // Simple user confirmation
          const response = await new Promise(resolve => {
            process.stdin.once('data', data => {
              resolve(data.toString().trim().toLowerCase());
            });
          });
          
          if (response !== 'y') {
            console.log('Import cancelled by user.');
            await client.close();
            process.exit(0);
          }
        }
        
        // Create documents from words
        console.log('Preparing word documents for import...');
        const wordDocs = words.map(word => ({
          word: word.toLowerCase(),
          lastUsed: new Date(0), // Never used date - Jan 1, 1970
          dateAdded: new Date(), // Current date
        }));
        
        // Insert words in batches
        const batchSize = 50; // Cosmos DB works well with smaller batch sizes
        let insertedCount = 0;
        let errorCount = 0;
        
        console.log(`Inserting ${wordDocs.length} words in batches of ${batchSize}...`);
        
        for (let i = 0; i < wordDocs.length; i += batchSize) {
          const batch = wordDocs.slice(i, i + batchSize);
          try {
            const result = await collection.insertMany(batch);
            insertedCount += result.insertedCount;
            console.log(`Batch ${Math.floor(i/batchSize) + 1}/${Math.ceil(wordDocs.length/batchSize)}: Inserted ${result.insertedCount} words`);
          } catch (error) {
            errorCount += batch.length;
            console.error(`Error inserting batch ${Math.floor(i/batchSize) + 1}:`, error.message);
          }
        }
        
        console.log('\nImport summary:');
        console.log(`- Total words processed: ${words.length}`);
        console.log(`- Successfully inserted: ${insertedCount}`);
        console.log(`- Failed: ${errorCount}`);
        
        if (insertedCount > 0) {
          console.log('\nImport completed successfully!');
        } else {
          console.error('\nImport failed - no words were inserted.');
        }
        
      } catch (error) {
        console.error('Error during import process:', error);
      } finally {
        // Ensure the database connection is closed
        if (client) {
          console.log('Closing database connection...');
          await client.close();
          console.log('Database connection closed.');
        }
      }
    }
    
    // Run the import function
    importWords().catch(console.error);
    '@
    $script | Out-File -FilePath "import-words.js" -Encoding utf8
    ```
    

### 3. Run the Import Script

1. Update the connection string in your `.env` file with your actual Cosmos DB connection string
2. Run the script:
    
    ```powershell
    node import-words.js
    ```
    
3. Follow the prompts to confirm import

## Phase 8: Security Hardening (2025 Best Practices)

### 1. Configure Network Security

1. Navigate to your Cosmos DB account
2. In left menu, select **Networking**
3. Configure **Firewall and virtual networks**:
    - Select **Selected networks**
    - Add your App Service subnet
    - Add your development IP address

### 2. Enable Defender for Cloud

1. Navigate to **Microsoft Defender for Cloud**
2. Enable enhanced security features:
    - Vulnerability assessment
    - Advanced threat protection
3. Apply to your resource group

### 3. Set Up Automated Backups

1. Navigate to Cosmos DB account
2. In left menu, select **Backup & Restore**
3. Configure backup policy:
    - Frequency: **Daily**
    - Retention: **7 days**
    - Storage redundancy: **Geo-redundant**

## Phase 9: Cost Optimization Setup

### 1. Create Budget and Cost Alerts

1. Navigate to **Cost Management + Billing**
2. Select **Budgets** > **+ Add**
3. Create a monthly budget for your resource group:
    - Budget name: `WordleGameBudget`
    - Amount: Set appropriate monthly budget (e.g., $50-100)
4. Set up alerts at 70% and 90% of budget

### 2. Configure Resource Scaling Rules

1. Navigate to your App Service
2. In left menu, select **Scale up (App Service plan)**
3. Configure scaling rules:
    - Development/testing: **Basic B1**
    - Production option: **Premium V2 P1v2** (cost-efficient for production)

### 3. Enable Azure Advisor Recommendations

1. Navigate to **Azure Advisor**
2. Configure scan for your resource group
3. Review recommendations for:
    - Cost optimization
    - Performance
    - Security

## Phase 10: Verify Deployment and Connectivity

### 1. Test Backend API

1. Navigate to your App Service
2. In the Overview page, click the URL
3. Add `/api/health` to test the health endpoint
4. Verify you receive a successful response

### 2. Test Frontend Application

1. Navigate to your Static Web App
2. Click on the URL to open your frontend
3. Test the application functionality

### 3. Monitor Initial Performance

1. Navigate to Application Insights
2. Review initial telemetry and performance metrics
3. Adjust configuration if needed

## Final Steps and Best Practices

1. **Document Your Environment**:
    
    - Create documentation for your Azure environment
    - Include connection details, deployment procedures, and troubleshooting steps
2. **Set Up Disaster Recovery**:
    
    - Document recovery procedures
    - Test restore functionality for Cosmos DB
3. **Implement Regular Maintenance**:
    
    - Schedule regular reviews of security and performance
    - Stay updated on Azure service updates
4. **Consider CI/CD Enhancement**:
    
    - Add automated testing to your deployment pipeline
    - Configure staging environments for pre-production validation

---

This comprehensive guide incorporates 2025 best practices including serverless architecture, security-focused design, proper resource isolation, and modern CI/CD patterns. It sets up a scalable, maintainable, and secure environment for your Wordle Game project.