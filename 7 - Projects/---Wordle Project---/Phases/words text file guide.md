The Wordle Game project needs to import 3000 five-letter words from a text file into the Cosmos DB database. The user wants a detailed guide for the Node.js import script approach.

# Detailed Step-by-Step Guide: Importing Words to Cosmos DB

## Prerequisites

- Your Azure Cosmos DB account is set up with a "wordleDb" database and "words" collection
- Node.js is installed on your computer
- Your list of 3000 five-letter words is ready in a text file

## Step 1: Set Up Your Project Environment

1. **Create a new directory for the import tool**:
    
    ```powershell
    mkdir wordle-db-import
    cd wordle-db-import
    ```
    
2. **Initialize a new Node.js project**:
    
    ```powershell
    npm init -y
    ```
    
3. **Install required dependencies**:
    
    ```powershell
    npm install mongodb dotenv fs
    ```
    
4. **Create a .env file for your connection string**:
    
    ```powershell
    New-Item -Path ".env" -ItemType "file"
    ```
    
5. **Add your Cosmos DB connection string to .env**:
    
    - In Azure Portal, go to your Cosmos DB account
    - Click "Connection String" in the left menu
    - Copy the "Primary Connection String"
    - Open the .env file and add:
    
    ```
    COSMOS_DB_CONNECTION_STRING=your_connection_string_here
    ```
    

## Step 2: Prepare Your Word List

1. **Format your word list**:
    
    - Each word should be on a new line
    - Words should be 5 letters
    - No punctuation or special characters
2. **Save your word list**:
    
    - Create a file named `words.txt` in your project directory
    - Paste your 3000 words, one per line
    - Example format:
    
    ```
    apple
    beach
    cloud
    dance
    earth
    ...
    ```
    

## Step 3: Create the Import Script

1. **Create a new file named `import-words.js`**:
    
    ```powershell
    New-Item -Path "import-words.js" -ItemType "file"
    ```
    
2. **Add the following code to the file**:
    

```javascript
// import-words.js
require('dotenv').config();
const fs = require('fs');
const { MongoClient } = require('mongodb');

// Get connection string from environment
const connectionString = process.env.COSMOS_DB_CONNECTION_STRING;
if (!connectionString) {
  console.error('Missing COSMOS_DB_CONNECTION_STRING in .env file');
  process.exit(1);
}

// Configuration
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
    const batchSize = 100; // Cosmos DB works well with smaller batch sizes
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
```

## Step 4: Execute the Import Script

1. **Run the script using Node.js**:
    
    ```powershell
    node import-words.js
    ```
    
2. **Follow the prompts** if the script detects existing data
    
3. **Monitor the output** to ensure the process is working:
    
    - You should see messages about reading words
    - Then connecting to the database
    - Then batch import progress
    - Finally a summary of what was imported

## Step 5: Verify Import Success

1. **Check the Azure Portal**:
    
    - Navigate to your Cosmos DB account
    - Go to "Data Explorer"
    - Select "wordleDb" and then "words" collection
    - Run a sample query by clicking "New SQL Query" and entering:
    
    ```sql
    SELECT * FROM c OFFSET 0 LIMIT 10
    ```
    
2. **Verify data structure**:
    
    - Each document should have `word` and `lastUsed` fields
    - All words should be lowercase
    - The `lastUsed` date should be set to 1970-01-01
3. **Check the word count**:
    
    - You can run this query to count the words:
    
    ```sql
    SELECT VALUE COUNT(1) FROM c
    ```
    
    - The result should match the number of words you imported

## Step 6: Create Indexes (Optional but Recommended)

1. **Add an index on the `word` field** for faster lookups:
    - In Data Explorer, right-click on your "words" collection
    - Select "New Index"
    - Set:
        - Indexing policy: `Range`
        - Field: `/word`
        - Order: `Ascending`
    - Click "OK"

## Troubleshooting Common Issues

- **Connection errors**: Double-check your connection string
- **"Timeout" errors**: Cosmos DB might be throttling requests; try reducing batch size
- **Duplicate key errors**: Some words might already exist in your database
- **"Request size too large"**: Try reducing batch size further
- **"RU exceeded"**: Your Cosmos DB might need more Request Units; increase provisioning

This import script provides a robust way to populate your Wordle Game database with a comprehensive word list. After importing, your backend will be able to select daily words and validate guesses against your custom word dictionary.