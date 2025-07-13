Based on our previous discussion, here are clean, simple-to-read notes covering the three server types, MCP server scopes, and setting up MCP servers for projects.

## The Three Server Types - How to Tell the Difference
### 1. STDIO (Standard Input/Output) - "Counter Service"

**Identification checklist:**

- Has `command` field (executable to run)
- Has `args` array (command-line arguments)
- Uses local file paths
- NO URL, port, or HTTP configuration
- Runs as local process

**Example Configuration:**

```json
{
  "command": "npx",
  "args": ["-y", "@itseasy21/mcp-knowledge-graph", "--memory-path", "./data"]
}
```


### 2. SSE (Server-Sent Events) - "Food Truck with Delivery"
**Identification checklist:**

- Has `type: "sse"` explicitly set
- Has `url` field (HTTP endpoint)
- May have `headers` for authentication
- NO `command` field
- Requires network connection

**Example Configuration:**

```json
{
  "type": "sse",
  "url": "https://api.example.com/mcp",
  "headers": {
    "Authorization": "Bearer ${API_KEY}"
  }
}
```


### 3. Streamable HTTP - "Modern Full Service"
**Identification checklist:**

- Has `type: "http"` or no type specified (default)
- Has `url` field (HTTP endpoint)
- Single endpoint for all communication
- May have session management
- Most scalable option

**Example Configuration:**

```json
{
  "type": "http",
  "url": "https://api.example.com/mcp",
  "headers": {
    "Authorization": "Bearer ${API_KEY}"
  }
}
```


## MCP Server Scopes - 3 Levels
| Scope | Config File | Location | Visibility | Use Case |
| :-- | :-- | :-- | :-- | :-- |
| **Local** | `~/.claude.json` | User home directory | Private to you | Personal dev servers, experiments |
| **Project** | `.mcp.json` | Project root | Shared with team | Team collaboration, version controlled |
| **User** | `~/.claude.json` | User home directory | Private to you | Personal utilities across projects |

**Key Points:**

- **Project scope** = shared with team (goes in git)
- **Local/User scope** = private to you only
- **Project scope** requires approval on first use (security feature)
- **Choose project scope** for team collaboration


## Setting Up MCP Server for Project
### Step 1: Run the Ideal Command

```bash
claude mcp add memory -s project -- npx -y @itseasy21/mcp-knowledge-graph --memory-path ./knowledge
```


### Step 2: Command Breakdown Table
| Component | Purpose | Details |
| :-- | :-- | :-- |
| `claude mcp add` | Claude CLI command | Adds MCP server configuration |
| `memory` | Server name | Your chosen identifier (can be anything) |
| `-s project` | Scope flag | Saves to project's `.mcp.json` file |
| `--` | Command separator | Everything after is the server command |
| `npx` | Node package executor | Runs npm packages without installing |
| `-y` | Auto-confirm flag | Skips installation prompts |
| `@itseasy21/mcp-knowledge-graph` | Package name | Specific knowledge graph server |
| `--memory-path ./knowledge` | Server argument | Where to store memory data |

### Step 3: What This Command Does (Numbered Steps)
1. **Creates Configuration File**
    - Generates `.mcp.json` in your project root
    - Sets up STDIO server type automatically
2. **Adds Server Entry**
    - Inserts server configuration into the JSON file
    - Uses the name you specified ("memory")
3. **Sets Up NPX Execution**
    - Configures npx to handle package installation
    - Uses global cache for efficiency
4. **Defines Data Storage**
    - Creates specified directory for memory storage
    - Ensures data persists across sessions
5. **Enables Team Sharing**
    - Configuration file can be committed to git
    - Team members get same setup

### Step 4: Alternative Manual Setup
**If you prefer manual configuration:**

1. **Create the file:** `.mcp.json` in project root
2. **Add this content:**
```json
{
  "mcpServers": {
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@itseasy21/mcp-knowledge-graph",
        "--memory-path",
        "./knowledge"
      ]
    }
  }
}
```

### Step 5: Verification Steps
1. **Restart Claude Desktop** completely
2. **Check for MCP indicator** in Claude interface
3. **Test server connection** using `/mcp` command
4. **Verify file creation** - check if `.mcp.json` exists
5. **Test functionality** - ask Claude to remember something

## Quick Reference Checklist

### Before Setup:
- Node.js installed (version 14+)
- Claude Desktop app installed
- Project directory exists

### After Setup:
- `.mcp.json` file created in project root
- Server appears in Claude's MCP tools
- Memory data stored in specified path
- Team can share configuration via git

### Troubleshooting:
- **No MCP tools showing?** → Restart Claude Desktop
- **Permission errors?** → Check directory write permissions
- **Package not found?** → Verify Node.js/npm installation
- **Server not responding?** → Check configuration syntax


## Memory Tips

**Remember these key patterns:**

- **STDIO** = `command` + `args` (local execution)
- **SSE/HTTP** = `type` + `url` (network connection)
- **Project scope** = `.mcp.json` (team sharing)
- **User scope** = `~/.claude.json` (personal only)

## How to install MCP in a project for Claude Code

### Cmd Example
```bash
claude mcp add memory -s project -- npx -y @itseasy21/mcp-knowledge-graph --memory-path /home/krwhynot/Projects/KitchenPantry/.knowledge
```



### File System Layout After Installation
```
/home/krwhynot/Projects/KitchenPantry/
├── .mcp.json                    ← Project MCP configuration (created)
├── .knowledge/                  ← Memory storage directory (created by server)
│   └── memory.jsonl            ← Knowledge graph data file
├── (your project files)
└── ...

~/.npm/_npx/
└── (package cache)/
    └── @itseasy21/mcp-knowledge-graph/   ← Package installed here
        ├── bin/
        ├── lib/
        └── package.json
```



