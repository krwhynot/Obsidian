# Comprehensive Setup Guide: MCP Memory Server with Cloudflare Workers

  

This guide will walk you through the complete process of setting up a globally distributed, serverless memory API for Model Context Protocol (MCP) tools using Cloudflare Workers and KV storage.

  

## Table of Contents

1. [Prerequisites](#prerequisites)

2. [Setting Up Your Cloudflare Account](#setting-up-your-cloudflare-account)

3. [Installing and Configuring Wrangler CLI](#installing-and-configuring-wrangler-cli)

4. [Creating a Workers Project](#creating-a-workers-project)

5. [Setting Up KV Namespaces](#setting-up-kv-namespaces)

6. [Implementing the Memory Server](#implementing-the-memory-server)

7. [Testing Your Implementation](#testing-your-implementation)

8. [Deploying Your Memory Server](#deploying-your-memory-server)

9. [Connecting MCP Tools](#connecting-mcp-tools)

10. [Troubleshooting](#troubleshooting)

  

## Prerequisites

  

Before you begin, ensure you have:

- Node.js and npm installed (version 16.x or later recommended)

- A text editor of your choice

- A Cloudflare account (free tier is sufficient)

- Basic knowledge of JavaScript/TypeScript

  

## Setting Up Your Cloudflare Account

  

1. **Create a Cloudflare Account**:

   - Go to [https://dash.cloudflare.com/sign-up](https://dash.cloudflare.com/sign-up)

   - Enter your email and create a password

   - Verify your email address

  

2. **Create an API Token**:

   - Log in to your Cloudflare dashboard

   - Navigate to "My Profile" > "API Tokens"

   - Click "Create Token"

   - Select "Create Custom Token"

   - Name it "MCP Memory Server"

   - Under "Permissions" add:

     - Account > Workers Scripts > Edit

     - Account > Workers KV Storage > Edit

     - Account > Account Settings > Read

   - Under "Account Resources" select your account

   - Set an expiration (e.g., 90 days)

   - Click "Continue to summary" and then "Create Token"

   - **IMPORTANT**: Copy and save the generated token securely; you'll only see it once

  

## Installing and Configuring Wrangler CLI

  

### For Windows:

  

1. **Install Wrangler**:

   ```

   npm install -g wrangler

   ```

  

2. **Verify Installation**:

   ```

   wrangler --version

   ```

  

3. **Configure API Token**:

   - For Command Prompt:

     ```

     set CLOUDFLARE_API_TOKEN=your_api_token_here

     ```

   - For PowerShell:

     ```

     $env:CLOUDFLARE_API_TOKEN = "your_api_token_here"

     ```

   - To verify it was set correctly:

     - Command Prompt: `echo %CLOUDFLARE_API_TOKEN%`

     - PowerShell: `echo $env:CLOUDFLARE_API_TOKEN`

  

### For macOS/Linux:

  

1. **Install Wrangler**:

   ```

   npm install -g wrangler

   ```

  

2. **Verify Installation**:

   ```

   wrangler --version

   ```

  

3. **Configure API Token**:

   ```

   export CLOUDFLARE_API_TOKEN=your_api_token_here

   ```

   - To verify: `echo $CLOUDFLARE_API_TOKEN`

  

## Creating a Workers Project

  

1. **Initialize a New Project**:

   ```

   wrangler init mcp-memory-server

   ```

   - When prompted:

     - Choose TypeScript (recommended for better type safety)

     - Choose to use git for version control

     - Choose to deploy your application

  

2. **Navigate to Your Project Directory**:

   ```

   cd mcp-memory-server

   ```

  

3. **Examine the Project Structure**:

   - `src/index.ts` (or `index.js`): Main Worker code

   - `wrangler.toml`: Configuration file

   - `package.json`: Node.js dependencies

  

## Setting Up KV Namespaces

  

1. **Create KV Namespaces**:

   ```

   wrangler kv:namespace create "ENTITY_STORE"

   wrangler kv:namespace create "METADATA_STORE"

   wrangler kv:namespace create "GRAPH_STORE"

   ```

  

2. **Note the Namespace IDs**:

   Each command will output something like:

   ```

   Add the following to your wrangler.toml:

   kv_namespaces = [

     { binding = "ENTITY_STORE", id = "abcdef123456" }

   ]

   ```

  

3. **Update wrangler.toml**:

   Open `wrangler.toml` and add the KV namespace bindings:

   ```toml

   # Existing wrangler.toml content will be here

  

   # Add these KV namespace bindings

   kv_namespaces = [

     { binding = "ENTITY_STORE", id = "your_entity_store_id_here" },

     { binding = "METADATA_STORE", id = "your_metadata_store_id_here" },

     { binding = "GRAPH_STORE", id = "your_graph_store_id_here" }

   ]

   ```

  

4. **Create Development Namespaces** (Optional but recommended):

   ```

   wrangler kv:namespace create "ENTITY_STORE" --preview

   wrangler kv:namespace create "METADATA_STORE" --preview

   wrangler kv:namespace create "GRAPH_STORE" --preview

   ```

   Add these to your `wrangler.toml` as well:

   ```toml

   # Development namespaces

   [env.dev]

   kv_namespaces = [

     { binding = "ENTITY_STORE", id = "your_dev_entity_store_id_here", preview_id = "your_preview_entity_store_id_here" },

     { binding = "METADATA_STORE", id = "your_dev_metadata_store_id_here", preview_id = "your_preview_metadata_store_id_here" },

     { binding = "GRAPH_STORE", id = "your_dev_graph_store_id_here", preview_id = "your_preview_graph_store_id_here" }

   ]

   ```

  

## Implementing the Memory Server

  

### 1. Define Types (TypeScript)

  

Create a file `src/types.ts`:

  

```typescript

// Entity types

export interface Entity {

  id: string;

  content: string;

  category?: string;

  importance?: number;

  tags?: string[];

  embedding?: number[];

  created_at: number;

}

  

// Observation types

export interface Observation {

  id: string;

  entity_id: string;

  content: string;

  timestamp: number;

}

  

// Metadata types

export interface Metadata {

  id: string;

  entity_id: string;

  access_count: number;

  importance: number;

  relevance_score: number;

  complexity: number;

  last_accessed: number;

}

  

// Graph types

export interface GraphNode {

  id: string;

  type: 'entity' | 'observation';

  properties: Record<string, any>;

}

  

export interface GraphEdge {

  source: string;

  target: string;

  type: string;

  properties?: Record<string, any>;

}

  

// Request/Response types

export interface CreateEntityRequest {

  content: string;

  category?: string;

  tags?: string[];

  importance?: number;

}

  

export interface AddObservationRequest {

  entity_id: string;

  content: string;

}

  

export interface SearchNodesRequest {

  query: string;

  category?: string;

  limit?: number;

  threshold?: number;

}

  

export interface ReadGraphRequest {

  node_id?: string;

  depth?: number;

  edge_types?: string[];

}

```

  

### 2. Implement Core Functionality

  

Replace the content of `src/index.ts` with:

  

```typescript

import { Entity, Observation, Metadata, GraphNode, GraphEdge,

  CreateEntityRequest, AddObservationRequest, SearchNodesRequest, ReadGraphRequest } from './types';

  

export interface Env {

  ENTITY_STORE: KVNamespace;

  METADATA_STORE: KVNamespace;

  GRAPH_STORE: KVNamespace;

}

  

// Helper function to generate UUIDs

function generateUUID(): string {

  return crypto.randomUUID();

}

  

// Helper function to calculate embedding (simplified for MVP)

// In a real implementation, you would use a proper embedding model

function calculateEmbedding(text: string): number[] {

  // This is a placeholder - in production you would use a real embedding model

  // or call an external API like OpenAI's embedding endpoint

  return Array.from({ length: 5 }, () => Math.random());

}

  

// Helper function to calculate similarity between embeddings

function calculateSimilarity(embedding1: number[], embedding2: number[]): number {

  // Simple cosine similarity implementation

  const dotProduct = embedding1.reduce((sum, val, i) => sum + val * embedding2[i], 0);

  const magnitude1 = Math.sqrt(embedding1.reduce((sum, val) => sum + val * val, 0));

  const magnitude2 = Math.sqrt(embedding2.reduce((sum, val) => sum + val * val, 0));

  return dotProduct / (magnitude1 * magnitude2);

}

  

export default {

  // Handle incoming requests

  async fetch(request: Request, env: Env, ctx: ExecutionContext): Promise<Response> {

    const url = new URL(request.url);

    const path = url.pathname;

    // CORS headers for cross-origin requests

    const corsHeaders = {

      'Access-Control-Allow-Origin': '*',

      'Access-Control-Allow-Methods': 'GET, POST, OPTIONS',

      'Access-Control-Allow-Headers': 'Content-Type',

    };

    // Handle OPTIONS requests (CORS preflight)

    if (request.method === 'OPTIONS') {

      return new Response(null, {

        headers: corsHeaders,

      });

    }

    // Route requests to appropriate handlers

    try {

      if (path === '/api/entities' && request.method === 'POST') {

        const data = await request.json() as CreateEntityRequest;

        const result = await this.createEntity(env, data);

        return new Response(JSON.stringify(result), {

          headers: { 'Content-Type': 'application/json', ...corsHeaders },

        });

      }

      else if (path === '/api/observations' && request.method === 'POST') {

        const data = await request.json() as AddObservationRequest;

        const result = await this.addObservation(env, data);

        return new Response(JSON.stringify(result), {

          headers: { 'Content-Type': 'application/json', ...corsHeaders },

        });

      }

      else if (path === '/api/search' && request.method === 'POST') {

        const data = await request.json() as SearchNodesRequest;

        const result = await this.searchNodes(env, data);

        return new Response(JSON.stringify(result), {

          headers: { 'Content-Type': 'application/json', ...corsHeaders },

        });

      }

      else if (path === '/api/graph' && request.method === 'POST') {

        const data = await request.json() as ReadGraphRequest;

        const result = await this.readGraph(env, data);

        return new Response(JSON.stringify(result), {

          headers: { 'Content-Type': 'application/json', ...corsHeaders },

        });

      }

      else if (path === '/api/health' && request.method === 'GET') {

        return new Response(JSON.stringify({ status: 'ok' }), {

          headers: { 'Content-Type': 'application/json', ...corsHeaders },

        });

      }

      // If no route matches

      return new Response('Not found', { status: 404, headers: corsHeaders });

    } catch (error) {

      console.error('Error processing request:', error);

      return new Response(JSON.stringify({ error: error.message }), {

        status: 500,

        headers: { 'Content-Type': 'application/json', ...corsHeaders },

      });

    }

  },

  

  // Create a new entity

  async createEntity(env: Env, data: CreateEntityRequest): Promise<Entity> {

    const id = generateUUID();

    const now = Date.now();

    // Generate embedding for the content

    const embedding = calculateEmbedding(data.content);

    // Create entity object

    const entity: Entity = {

      id,

      content: data.content,

      category: data.category || 'general',

      importance: data.importance || 5, // Default importance

      tags: data.tags || [],

      embedding,

      created_at: now,

    };

    // Store entity in KV

    await env.ENTITY_STORE.put(id, JSON.stringify(entity));

    // Create and store metadata

    const metadata: Metadata = {

      id: generateUUID(),

      entity_id: id,

      access_count: 0,

      importance: data.importance || 5,

      relevance_score: 1.0, // Initial score

      complexity: data.content.length / 100, // Simple complexity metric

      last_accessed: now,

    };

    await env.METADATA_STORE.put(metadata.id, JSON.stringify(metadata));

    // Create graph node

    const node: GraphNode = {

      id,

      type: 'entity',

      properties: {

        category: entity.category,

        created_at: entity.created_at,

      },

    };

    await env.GRAPH_STORE.put(`node:${id}`, JSON.stringify(node));

    return entity;

  },

  

  // Add an observation to an entity

  async addObservation(env: Env, data: AddObservationRequest): Promise<Observation> {

    // Check if entity exists

    const entityJson = await env.ENTITY_STORE.get(data.entity_id);

    if (!entityJson) {

      throw new Error(`Entity with ID ${data.entity_id} not found`);

    }

    const id = generateUUID();

    const now = Date.now();

    // Create observation object

    const observation: Observation = {

      id,

      entity_id: data.entity_id,

      content: data.content,

      timestamp: now,

    };

    // Store observation in KV

    await env.ENTITY_STORE.put(`obs:${id}`, JSON.stringify(observation));

    // Create graph node for observation

    const node: GraphNode = {

      id,

      type: 'observation',

      properties: {

        entity_id: data.entity_id,

        timestamp: now,

      },

    };

    await env.GRAPH_STORE.put(`node:${id}`, JSON.stringify(node));

    // Create edge between entity and observation

    const edge: GraphEdge = {

      source: data.entity_id,

      target: id,

      type: 'HAS_OBSERVATION',

    };

    await env.GRAPH_STORE.put(`edge:${data.entity_id}:${id}`, JSON.stringify(edge));

    return observation;

  },

  

  // Search for nodes based on content similarity

  async searchNodes(env: Env, data: SearchNodesRequest): Promise<Entity[]> {

    const { query, category, limit = 10, threshold = 0.7 } = data;

    // Generate embedding for the query

    const queryEmbedding = calculateEmbedding(query);

    // List all entities (in a real implementation, you'd use a more efficient approach)

    const entityList = await env.ENTITY_STORE.list();

    const entities: Entity[] = [];

    // Process each entity

    for (const key of entityList.keys) {

      // Skip observation keys

      if (key.name.startsWith('obs:')) continue;

      const entityJson = await env.ENTITY_STORE.get(key.name);

      if (entityJson) {

        const entity = JSON.parse(entityJson) as Entity;

        // Filter by category if specified

        if (category && entity.category !== category) continue;

        // Calculate similarity if entity has embedding

        if (entity.embedding) {

          const similarity = calculateSimilarity(queryEmbedding, entity.embedding);

          // Add entity if similarity is above threshold

          if (similarity >= threshold) {

            // Add similarity score for sorting

            (entity as any).similarity = similarity;

            entities.push(entity);

          }

        }

      }

    }

    // Sort by similarity (highest first) and limit results

    return entities

      .sort((a, b) => (b as any).similarity - (a as any).similarity)

      .slice(0, limit)

      .map(entity => {

        // Remove similarity from returned object

        const { similarity, ...rest } = entity as any;

        return rest;

      });

  },

  

  // Read graph data

  async readGraph(env: Env, data: ReadGraphRequest): Promise<{nodes: GraphNode[], edges: GraphEdge[]}> {

    const { node_id, depth = 1, edge_types } = data;

    const nodes: GraphNode[] = [];

    const edges: GraphEdge[] = [];

    const processedNodes = new Set<string>();

    // If node_id is provided, start from that node

    if (node_id) {

      await this.traverseGraph(env, node_id, depth, edge_types, nodes, edges, processedNodes);

    } else {

      // Otherwise, return all nodes and edges (limited for MVP)

      const nodeList = await env.GRAPH_STORE.list({ prefix: 'node:' });

      for (const key of nodeList.keys) {

        const nodeJson = await env.GRAPH_STORE.get(key.name);

        if (nodeJson) {

          nodes.push(JSON.parse(nodeJson) as GraphNode);

        }

      }

      const edgeList = await env.GRAPH_STORE.list({ prefix: 'edge:' });

      for (const key of edgeList.keys) {

        const edgeJson = await env.GRAPH_STORE.get(key.name);

        if (edgeJson) {

          const edge = JSON.parse(edgeJson) as GraphEdge;

          if (!edge_types || edge_types.includes(edge.type)) {

            edges.push(edge);

          }

        }

      }

    }

    return { nodes, edges };

  },

  

  // Helper method to traverse the graph

  async traverseGraph(

    env: Env,

    nodeId: string,

    depth: number,

    edgeTypes: string[] | undefined,

    nodes: GraphNode[],

    edges: GraphEdge[],

    processedNodes: Set<string>

  ): Promise<void> {

    // Stop if we've already processed this node or reached max depth

    if (processedNodes.has(nodeId) || depth <= 0) return;

    // Mark node as processed

    processedNodes.add(nodeId);

    // Get node data

    const nodeJson = await env.GRAPH_STORE.get(`node:${nodeId}`);

    if (nodeJson) {

      const node = JSON.parse(nodeJson) as GraphNode;

      nodes.push(node);

      // Find all edges connected to this node

      const edgeList = await env.GRAPH_STORE.list({ prefix: `edge:${nodeId}:` });

      for (const key of edgeList.keys) {

        const edgeJson = await env.GRAPH_STORE.get(key.name);

        if (edgeJson) {

          const edge = JSON.parse(edgeJson) as GraphEdge;

          // Filter by edge type if specified

          if (!edgeTypes || edgeTypes.includes(edge.type)) {

            edges.push(edge);

            // Recursively traverse connected nodes

            await this.traverseGraph(

              env,

              edge.target,

              depth - 1,

              edgeTypes,

              nodes,

              edges,

              processedNodes

            );

          }

        }

      }

    }

  }

};

```

  

### 3. Update Package.json

  

Make sure your `package.json` includes the necessary dependencies:

  

```json

{

  "name": "mcp-memory-server",

  "version": "0.1.0",

  "private": true,

  "scripts": {

    "deploy": "wrangler deploy",

    "start": "wrangler dev",

    "test": "vitest run"

  },

  "devDependencies": {

    "@cloudflare/workers-types": "^4.20230419.0",

    "typescript": "^5.0.4",

    "vitest": "^0.31.0",

    "wrangler": "^3.0.0"

  }

}

```

  

## Testing Your Implementation

  

### 1. Local Testing

  

1. **Start the Development Server**:

   ```

   npm run start

   ```

   This will start a local development server, typically on port 8787.

  

2. **Test the Health Endpoint**:

   Open your browser and navigate to:

   ```

   http://localhost:8787/api/health

   ```

   You should see: `{"status":"ok"}`

  

3. **Test Creating an Entity**:

   Using a tool like curl, Postman, or a browser extension:

   ```

   curl -X POST http://localhost:8787/api/entities \

     -H "Content-Type: application/json" \

     -d '{"content":"This is a test entity","category":"test","tags":["test","example"]}'

   ```

  

4. **Test Adding an Observation**:

   ```

   curl -X POST http://localhost:8787/api/observations \

     -H "Content-Type: application/json" \

     -d '{"entity_id":"ENTITY_ID_FROM_PREVIOUS_STEP","content":"This is a test observation"}'

   ```

  

5. **Test Searching**:

   ```

   curl -X POST http://localhost:8787/api/search \

     -H "Content-Type: application/json" \

     -d '{"query":"test","limit":5}'

   ```

  

6. **Test Graph Reading**:

   ```

   curl -X POST http://localhost:8787/api/graph \

     -H "Content-Type: application/json" \

     -d '{}'

   ```

  

### 2. Automated Testing (Optional)

  

Create a file `src/index.test.ts`:

  

```typescript

import { describe, it, expect, vi, beforeEach } from 'vitest';

import { unstable_dev } from 'wrangler';

import type { UnstableDevWorker } from 'wrangler';

  

describe('Memory Server Worker', () => {

  let worker: UnstableDevWorker;

  

  beforeEach(async () => {

    worker = await unstable_dev('src/index.ts', {

      experimental: { disableExperimentalWarning: true },

    });

  });

  

  afterEach(async () => {

    await worker.stop();

  });

  

  it('should return health check', async () => {

    const resp = await worker.fetch('/api/health');

    const data = await resp.json();

    expect(resp.status).toBe(200);

    expect(data).toHaveProperty('status', 'ok');

  });

  

  // Add more tests for your endpoints

});

```

  

Run tests with:

```

npm test

```

  

## Deploying Your Memory Server

  

1. **Deploy to Cloudflare Workers**:

   ```

   npm run deploy

   ```

  

2. **Verify Deployment**:

   After deployment, you'll receive a URL for your Worker, typically in the format:

   ```

   https://mcp-memory-server.<your-subdomain>.workers.dev

   ```

  

3. **Test the Deployed Endpoints**:

   ```

   curl https://mcp-memory-server.<your-subdomain>.workers.dev/api/health

   ```

  

## Connecting MCP Tools

  

### Connecting Claude Desktop

  

To connect Claude Desktop to your memory server:

  

1. Open Claude Desktop settings

2. Navigate to the "Memory" section

3. Enable "External Memory Server"

4. Enter your Worker URL:

   ```

   https://mcp-memory-server.<your-subdomain>.workers.dev

   ```

5. Save settings

  

### Connecting Cline VSCode Extension

  

To connect Cline to your memory server:

  

1. Open VSCode settings

2. Search for "Cline"

3. Find "Cline: Memory Server URL"

4. Enter your Worker URL:

   ```

   https://mcp-memory-server.<your-subdomain>.workers.dev

   ```

5. Save settings

  

## Troubleshooting

  

### Common Issues and Solutions

  

1. **Authentication Errors**:

   - Ensure your API token has the correct permissions

   - Check that the environment variable is set correctly

   - Try regenerating the API token

  

2. **KV Namespace Issues**:

   - Verify namespace IDs in wrangler.toml match those in your Cloudflare dashboard

   - Check for typos in binding names

  

3. **Deployment Failures**:

   - Check for TypeScript errors with `tsc --noEmit`

   - Ensure wrangler.toml is correctly formatted

   - Check Cloudflare account status and limits

  

4. **CORS Issues**:

   - If your MCP tools can't connect, check the CORS headers in the response

   - You may need to adjust the 'Access-Control-Allow-Origin' header

  

5. **Performance Issues**:

   - KV has rate limits; consider implementing caching for frequently accessed data

   - Large datasets may require pagination or more efficient querying

  

### Getting Help

  

- Cloudflare Workers documentation: [https://developers.cloudflare.com/workers/](https://developers.cloudflare.com/workers/)

- Cloudflare KV documentation: [https://developers.cloudflare.com/workers/runtime-apis/kv/](https://developers.cloudflare.com/workers/runtime-apis/kv/)

- Cloudflare Workers Discord: [https://discord.gg/cloudflaredev](https://discord.gg/cloudflaredev)

  

## Next Steps

  

After your basic memory server is up and running, consider these enhancements:

  

1. **Implement Authentication**:

   - Add API key validation

   - Implement user-specific memory stores

  

2. **Improve Embedding Generation**:

   - Integrate with a proper embedding model API

   - Implement caching for embeddings

  

3. **Add Advanced Graph Operations**:

   - Implement more sophisticated graph traversal

   - Add relationship types and properties

  

4. **Performance Optimizations**:

   - Implement batch operations

   - Add caching layers

  

5. **Monitoring and Analytics**:

   - Track usage patterns

   - Implement performance metrics

  

---

  

This completes the setup guide for your MCP memory server using Cloudflare Workers and KV namespaces. You now have a globally distributed, serverless memory API that can be used with Claude Desktop, Cline VSCode extension, and other MCP-based tools.