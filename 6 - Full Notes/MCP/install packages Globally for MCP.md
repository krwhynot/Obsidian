```bash
npm install -g \
  exa-mcp-server \
  @playwright/mcp@latest \
  @supabase/mcp-server-supabase@latest \
  @modelcontextprotocol/server-sequential-thinking@latest \
  @itseasy21/mcp-knowledge-graph \
  @upstash/context7-mcp
```

verify each is on your PATH:
```bash
which exa-mcp-server
which playwright-mcp
which mcp-server-supabase
which server-sequential-thinking
which mcp-knowledge-graph
which context7-mcp
```


```bash

test-mcp-servers() {
  echo "→ Testing Exa MCP Server"
  exa-mcp-server --help

  echo; echo "→ Testing Playwright MCP Server"
  playwright-mcp --help

  echo; echo "→ Testing Supabase MCP Server"
  mcp-server-supabase --help

  echo; echo "→ Testing Sequential Thinking MCP Server"
  server-sequential-thinking --help

  echo; echo "→ Testing Knowledge Graph MCP Server"
  mcp-knowledge-graph --help

  echo; echo "→ Testing Context7 MCP Server"
  context7-mcp --help
}
```

sbp_2e0685253d140230d4e57766a522208a3e9f6b39
export SUPABASE_ACCESS_TOKEN="sbp_2e0685253d140230d4e57766a522208a3e9f6b39"