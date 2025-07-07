```
{

    "mcpServers": {

        "exa": {

            "command": "npx",

            "args": [

                "-y",

                "exa-mcp-server",

                "--tools=web_search_exa,research_paper_search,company_research,crawling,competitor_finder,linkedin_search,wikipedia_search_exa,github_search"

            ],

            "env": {

                "EXA_API_KEY": "a9b28749-adac-4675-ac21-b6d6afbb65f1"

            }

        },

        "filesystem": {

            "command": "npx",

            "args": [

                "-y",

                "@modelcontextprotocol/server-filesystem@latest",

                "/mnt/r/Projects/KitchenPantry",

                "/mnt/c/Users/revadmin/Documents"

            ],

            "env": {

                "MCP_TRANSPORT": "stdio",

                "MCP_LOG_LEVEL": "info",

                "NODE_ENV": "production"

            }

        },

        "sequential-thinking": {

            "command": "npx",

            "args": [

                "-y",

                "@modelcontextprotocol/server-sequential-thinking@latest"

            ],

            "env": {}

        },

        "Context7": {

            "command": "npx",

            "args": [

                "-y",

                "@upstash/context7-mcp"

            ]

        },

        "knowledge": {

            "command": "npx",

            "args": [

                "-y",

                "mcp-knowledge-graph"

            ],

            "env": {

                "STORAGE_PATH": "/mnt/r/Projects/KitchenPantry/.knowledge",

                "MCP_LOG_LEVEL": "info"

            }

        },

        "brave-search": {

            "command": "npx",

            "args": [

                "-y",

                "@modelcontextprotocol/server-brave-search"

            ],

            "env": {

                "BRAVE_API_KEY": "BSA8_xD0H0Y1SXakh5ZTfgIzwSAwPkU"

            }

        }

    }

}
```