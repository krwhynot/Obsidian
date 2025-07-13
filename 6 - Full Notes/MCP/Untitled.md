claude mcp list
exa: npx -y exa-mcp-server --tools=web_search_exa,research_paper_search,company_research,crawling,competitor_finder,linkedin_search,wikipedia_search_exa,github_search

playwright: npx @playwright/mcp@latest

supabase: npx -y @supabase/mcp-server-supabase@latest --project-ref=fxeznuvwwhdrbevymfuf

sequential-thinking: npx -y @modelcontextprotocol/server-sequential-thinking@latest --max-thoughts=15 --branch-limit=2 --detail-level=low --revision-depth=3

memory: npx -y mcp-knowledge-graph --memory-path /home/krwhynot/Projects/KitchenPantry/.knowledge

Context7: npx -y @upstash/context7-mcp

