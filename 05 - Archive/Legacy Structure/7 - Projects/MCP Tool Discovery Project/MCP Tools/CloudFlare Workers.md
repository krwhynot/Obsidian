# Complete MCP Cloudflare Setup Guide

aVbknwlnse6S6LEAKiQGYR8oLCFws6C0TbwUYcp9

_Deploy MCP servers to Cloudflare Workers and connect both Claude Desktop and Cline VSCode_

## 📋 Prerequisites

### Required Software

- [ ] **Node.js 18+** (`node --version`)
- [ ] **npm** (`npm --version`)
- [ ] **VS Code** with Cline extension installed
- [ ] **Claude Desktop** already working
- [ ] **Git** for version control

### Required Accounts

- [ ] **Cloudflare Account** (free) - [Sign up here](https://dash.cloudflare.com/sign-up)
- [ ] **GitHub Account** (for GitHub MCP server)

---

## Phase 1: Cloudflare Setup

### Step 1: Install Cloudflare CLI (Wrangler)

```powershell
# Install Wrangler CLI globally
npm install -g wrangler

# Verify installation
wrangler --version
```

### Step 2: Authenticate with Cloudflare

```powershell
# Login to your Cloudflare account
wrangler login
```

- This opens your browser to authenticate
- Grant permissions to Wrangler
- Return to terminal when complete

### Step 3: Verify Authentication

```powershell
# Check if you're logged in
wrangler whoami
```

Should show your Cloudflare email and account ID.

---

## Phase 2: Deploy MCP Servers to Cloudflare

### Step 1: Create Project Directory

```powershell
# Create main project folder
mkdir mcp-cloudflare-servers
cd mcp-cloudflare-servers

# Initialize npm project
npm init -y
```

### Step 2: Create Memory Server

#### Create Memory Server Directory

```powershell
mkdir memory-server
cd memory-server
```

#### Create wrangler.toml

```toml
name = "mcp-memory-server"
main = "src/index.js"
compatibility_date = "2025-05-25"

[vars]
ENVIRONMENT = "production"

[[kv_namespaces]]
binding = "MEMORY_STORE"
id = "your_kv_namespace_id"
preview_id = "your_preview_kv_namespace_id"
```

#### Create KV Namespace for Memory Storage

```powershell
# Create production KV namespace
wrangler kv:namespace create "MEMORY_STORE"

# Create preview KV namespace  
wrangler kv:namespace create "MEMORY_STORE" --preview

# Copy the IDs from output and update wrangler.toml
```

#### Create Memory Server Code

Create `src/index.js`:

```javascript
export default {
  async fetch(request, env, ctx) {
    // Handle CORS preflight
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        },
      });
    }

    const url = new URL(request.url);
    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    };

    try {
      if (url.pathname === '/mcp/memory' && request.method === 'POST') {
        const body = await request.json();
        
        switch (body.method) {
          case 'create_entities':
            return await handleCreateEntities(body.params, env, headers);
          case 'search_nodes':
            return await handleSearchNodes(body.params, env, headers);
          case 'read_graph':
            return await handleReadGraph(env, headers);
          case 'add_observations':
            return await handleAddObservations(body.params, env, headers);
          default:
            return new Response(JSON.stringify({ error: 'Unknown method' }), 
              { status: 400, headers });
        }
      }

      return new Response(JSON.stringify({ error: 'Not found' }), 
        { status: 404, headers });
    } catch (error) {
      return new Response(JSON.stringify({ error: error.message }), 
        { status: 500, headers });
    }
  },
};

async function handleCreateEntities(params, env, headers) {
  const entities = params.entities || [];
  const results = [];
  
  for (const entity of entities) {
    const key = `entity:${entity.name}`;
    const data = {
      name: entity.name,
      entityType: entity.entityType,
      observations: entity.observations || [],
      createdAt: new Date().toISOString(),
      updatedAt: new Date().toISOString()
    };
    
    await env.MEMORY_STORE.put(key, JSON.stringify(data));
    results.push(data);
  }
  
  return new Response(JSON.stringify(results), { headers });
}

async function handleSearchNodes(params, env, headers) {
  const query = params.query || '';
  const entities = [];
  
  // Get all entity keys
  const list = await env.MEMORY_STORE.list({ prefix: 'entity:' });
  
  for (const key of list.keys) {
    const data = await env.MEMORY_STORE.get(key.name);
    if (data) {
      const entity = JSON.parse(data);
      // Simple search in name, type, and observations
      const searchText = `${entity.name} ${entity.entityType} ${entity.observations.join(' ')}`.toLowerCase();
      if (searchText.includes(query.toLowerCase())) {
        entities.push({
          type: 'entity',
          name: entity.name,
          entityType: entity.entityType,
          observations: entity.observations
        });
      }
    }
  }
  
  return new Response(JSON.stringify({ entities, relations: [] }), { headers });
}

async function handleReadGraph(env, headers) {
  const entities = [];
  const relations = [];
  
  // Get all entities
  const entityList = await env.MEMORY_STORE.list({ prefix: 'entity:' });
  for (const key of entityList.keys) {
    const data = await env.MEMORY_STORE.get(key.name);
    if (data) {
      const entity = JSON.parse(data);
      entities.push({
        type: 'entity',
        name: entity.name,
        entityType: entity.entityType,
        observations: entity.observations
      });
    }
  }
  
  // Get all relations
  const relationList = await env.MEMORY_STORE.list({ prefix: 'relation:' });
  for (const key of relationList.keys) {
    const data = await env.MEMORY_STORE.get(key.name);
    if (data) {
      const relation = JSON.parse(data);
      relations.push({
        type: 'relation',
        from: relation.from,
        to: relation.to,
        relationType: relation.relationType
      });
    }
  }
  
  return new Response(JSON.stringify({ entities, relations }), { headers });
}

async function handleAddObservations(params, env, headers) {
  const observations = params.observations || [];
  const results = [];
  
  for (const obs of observations) {
    const key = `entity:${obs.entityName}`;
    const existing = await env.MEMORY_STORE.get(key);
    
    if (existing) {
      const entity = JSON.parse(existing);
      entity.observations.push(...obs.contents);
      entity.updatedAt = new Date().toISOString();
      
      await env.MEMORY_STORE.put(key, JSON.stringify(entity));
      results.push({
        entityName: obs.entityName,
        addedObservations: obs.contents
      });
    }
  }
  
  return new Response(JSON.stringify(results), { headers });
}
```

#### Deploy Memory Server

```powershell
# Deploy to Cloudflare Workers
wrangler deploy

# Note the URL from output (e.g., https://mcp-memory-server.your-username.workers.dev)
```

### Step 3: Create GitHub Server

#### Create GitHub Server Directory

```powershell
cd ../
mkdir github-server
cd github-server
```

#### Create wrangler.toml

```toml
name = "mcp-github-server"
main = "src/index.js"
compatibility_date = "2025-05-25"

[vars]
ENVIRONMENT = "production"

[secrets]
GITHUB_TOKEN = "your_github_personal_access_token"
```

#### Set GitHub Token Secret

```powershell
# Set your GitHub personal access token
wrangler secret put GITHUB_TOKEN
# Paste your GitHub token when prompted
```

#### Create GitHub Server Code

Create `src/index.js`:

```javascript
export default {
  async fetch(request, env, ctx) {
    // Handle CORS
    if (request.method === 'OPTIONS') {
      return new Response(null, {
        headers: {
          'Access-Control-Allow-Origin': '*',
          'Access-Control-Allow-Methods': 'GET, POST, PUT, DELETE, OPTIONS',
          'Access-Control-Allow-Headers': 'Content-Type, Authorization',
        },
      });
    }

    const url = new URL(request.url);
    const headers = {
      'Access-Control-Allow-Origin': '*',
      'Content-Type': 'application/json',
    };

    try {
      if (url.pathname === '/mcp/github' && request.method === 'POST') {
        const body = await request.json();
        
        switch (body.method) {
          case 'list_repositories':
            return await handleListRepositories(env, headers);
          case 'get_repository':
            return await handleGetRepository(body.params, env, headers);
          case 'get_file_contents':
            return await handleGetFileContents(body.params, env, headers);
          default:
            return new Response(JSON.stringify({ error: 'Unknown method' }), 
              { status: 400, headers });
        }
      }

      return new Response(JSON.stringify({ error: 'Not found' }), 
        { status: 404, headers });
    } catch (error) {
      return new Response(JSON.stringify({ error: error.message }), 
        { status: 500, headers });
    }
  },
};

async function githubRequest(endpoint, env) {
  const response = await fetch(`https://api.github.com${endpoint}`, {
    headers: {
      'Authorization': `token ${env.GITHUB_TOKEN}`,
      'User-Agent': 'MCP-GitHub-Server',
      'Accept': 'application/vnd.github.v3+json'
    }
  });
  
  if (!response.ok) {
    throw new Error(`GitHub API error: ${response.status}`);
  }
  
  return response.json();
}

async function handleListRepositories(env, headers) {
  const repos = await githubRequest('/user/repos?sort=updated&per_page=50', env);
  
  const simplified = repos.map(repo => ({
    name: repo.name,
    full_name: repo.full_name,
    description: repo.description,
    language: repo.language,
    updated_at: repo.updated_at,
    private: repo.private
  }));
  
  return new Response(JSON.stringify(simplified), { headers });
}

async function handleGetRepository(params, env, headers) {
  const repoName = params.repository;
  const repo = await githubRequest(`/repos/${repoName}`, env);
  
  return new Response(JSON.stringify({
    name: repo.name,
    description: repo.description,
    language: repo.language,
    stars: repo.stargazers_count,
    forks: repo.forks_count,
    updated_at: repo.updated_at
  }), { headers });
}

async function handleGetFileContents(params, env, headers) {
  const { repository, path } = params;
  const file = await githubRequest(`/repos/${repository}/contents/${path}`, env);
  
  if (file.type === 'file') {
    const content = atob(file.content);
    return new Response(JSON.stringify({
      name: file.name,
      path: file.path,
      content: content,
      size: file.size
    }), { headers });
  }
  
  return new Response(JSON.stringify({ error: 'Not a file' }), 
    { status: 400, headers });
}
```

#### Deploy GitHub Server

```powershell
# Deploy GitHub server
wrangler deploy

# Note the URL from output
```

---

## Phase 3: Configure Claude Desktop

### Step 1: Backup Current Configuration

```powershell
# Backup your current config
Copy-Item "C:\Users\kyle.ramsy\AppData\Roaming\Claude\claude_desktop_config.json" "C:\Users\kyle.ramsy\AppData\Roaming\Claude\claude_desktop_config_backup_$(Get-Date -Format 'yyyyMMdd').json"
```

### Step 2: Create New Cloud Configuration

Replace your `claude_desktop_config.json` with:

```json
{
  "mcpServers": {
    "cloud-memory": {
      "transport": {
        "type": "sse",
        "url": "https://mcp-memory-server.your-username.workers.dev/mcp/memory"
      }
    },
    "cloud-github": {
      "transport": {
        "type": "sse", 
        "url": "https://mcp-github-server.your-username.workers.dev/mcp/github"
      }
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem@latest",
        "C:/Users/kyle.ramsy/Documents",
        "C:/Users/kyle.ramsy/Downloads",
        "C:/Users/kyle.ramsy/AppData/Roaming/Claude"
      ],
      "env": {
        "NODE_ENV": "production"
      }
    },
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking@latest"
      ],
      "env": {
        "NODE_ENV": "production"
      }
    },
    "tavily-search": {
      "command": "npx",
      "args": [
        "-y",
        "tavily-mcp@latest"
      ],
      "env": {
        "TAVILY_API_KEY": "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"
      }
    },
    "brave-search": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-brave-search@latest"
      ],
      "env": {
        "BRAVE_API_KEY": "BSA8_xD0H0Y1SXakh5ZTfgIzwSAwPkU"
      }
    }
  }
}
```

**Important:** Replace `your-username` with your actual Cloudflare Workers subdomain.

### Step 3: Restart Claude Desktop

- Close Claude Desktop completely
- Reopen Claude Desktop
- Test with: "Can you access my cloud memory?"

---

## Phase 4: Configure Cline in VS Code

### Step 1: Install Cline Extension

1. Open VS Code
2. Go to Extensions (Ctrl+Shift+X)
3. Search for "Cline"
4. Install the Cline extension by Saoud Rizwan

### Step 2: Configure Cline MCP Settings

#### Method 1: Via VS Code Settings

1. Open VS Code Settings (Ctrl+,)
2. Search for "cline mcp"
3. Find "Cline: Mcp Servers" setting
4. Click "Edit in settings.json"

#### Method 2: Direct Settings File

Open/create `.vscode/settings.json` in your workspace:

```json
{
  "cline.mcpServers": {
    "cloud-memory": {
      "transport": {
        "type": "sse",
        "url": "https://mcp-memory-server.your-username.workers.dev/mcp/memory"
      }
    },
    "cloud-github": {
      "transport": {
        "type": "sse",
        "url": "https://mcp-github-server.your-username.workers.dev/mcp/github"
      }
    }
  }
}
```

### Step 3: Test Cline Integration

1. Open Cline panel in VS Code (usually in sidebar)
2. Start a chat with Cline
3. Test: "Can you access my cloud memory and GitHub repositories?"

---

## Phase 5: Testing & Validation

### Test 1: Memory Sync Between Tools

#### In Claude Desktop:

```
"Remember that I'm working on a Wordle clone project with React and TypeScript"
```

#### In Cline (VS Code):

```
"What project am I currently working on?"
```

Should respond with Wordle clone information.

### Test 2: GitHub Integration

#### In either tool:

```
"List my GitHub repositories"
"Show me the contents of my latest repository"
```

### Test 3: Cross-Tool Knowledge

#### Setup knowledge in Claude Desktop:

```
"Save this architectural decision: We're using Context + useReducer for state management in our React app"
```

#### Access in Cline:

```
"What state management approach are we using for React?"
```

---

## 🔧 Troubleshooting

### Common Issues

#### 1. "Connection refused" or "Server not found"

**Solution:**

- Verify Cloudflare Workers are deployed: `wrangler list`
- Check URLs in config files match your actual worker URLs
- Ensure workers are published, not just drafted

#### 2. "CORS errors" in browser console

**Solution:**

- Verify CORS headers in worker code
- Check that OPTIONS requests are handled properly

#### 3. Claude Desktop not connecting to cloud servers

**Solution:**

- Restart Claude Desktop after config changes
- Check config file syntax with JSON validator
- Verify worker URLs are accessible in browser

#### 4. Cline not showing MCP options

**Solution:**

- Ensure Cline extension is latest version
- Check VS Code settings for MCP configuration
- Restart VS Code after configuration changes

#### 5. GitHub server authentication errors

**Solution:**

- Verify GitHub token has correct permissions
- Check token is set as secret: `wrangler secret list`
- Ensure token isn't expired

### Debugging Commands

```powershell
# Check Cloudflare Workers status
wrangler list

# View worker logs
wrangler tail mcp-memory-server
wrangler tail mcp-github-server

# Test workers directly
curl https://mcp-memory-server.your-username.workers.dev/mcp/memory

# Validate JSON configuration
Get-Content "C:\Users\kyle.ramsy\AppData\Roaming\Claude\claude_desktop_config.json" | ConvertFrom-Json
```

---

## 💰 Cost Monitoring

### Check Cloudflare Usage

1. Go to [Cloudflare Dashboard](https://dash.cloudflare.com/)
2. Navigate to Workers & Pages
3. Check usage for each worker
4. Monitor requests per day (100k free daily)

### Expected Usage

- **Light usage:** 1k-5k requests/day (FREE)
- **Medium usage:** 10k-50k requests/day (FREE)
- **Heavy usage:** 100k+ requests/day ($5/month)

---

## 🎉 Success Indicators

### ✅ Setup Complete When:

- [ ] Both Claude Desktop and Cline can access cloud memory
- [ ] GitHub integration works in both tools
- [ ] Knowledge persists between Claude Desktop and Cline sessions
- [ ] New devices only need config file copy (no additional setup)

### 🚀 You'll Know It's Working When:

1. **Start conversation in Claude Desktop** about your project
2. **Switch to Cline in VS Code**
3. **Cline already knows** your project context
4. **Both tools share** the same GitHub access and memory

**Congratulations! You now have a unified AI development environment!** 🌟

---

## 📞 Next Steps After Setup

1. **Test the integration** with a real project
2. **Add more MCP servers** (database, web scraping, etc.)
3. **Create custom MCP servers** for your specific workflows
4. **Share config** with team members for consistent setup

Remember: Your worker URLs will be unique to your Cloudflare account. Always replace `your-username` with your actual subdomain!