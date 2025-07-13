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