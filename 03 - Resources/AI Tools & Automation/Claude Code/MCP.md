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

        "playwright": {

            "command": "npx",

            "args": ["@playwright/mcp@latest"]

        },

        "supabase": {

            "command": "npx",

            "args": [

                "-y",

                "@supabase/mcp-server-supabase@latest",

                "--project-ref=sbrlujvekkpthwztxfyo"

            ],

            "env": {

                "SUPABASE_ACCESS_TOKEN": "sbp_0faf75548a427af4dc57c9b90ddbe3481a6894d3"

            }

        },

        "perplexity-ask": {

            "command": "npx",

            "args": ["-y", "server-perplexity-ask"],

            "env": {

                "PERPLEXITY_API_KEY": "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"

            }

        },

        "filesystem": {

            "command": "npx",

            "args": [

                "-y",

                "@modelcontextprotocol/server-filesystem@latest",

                "/home/krwhynot/Projects/ForkFlow-crm"

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

                "@modelcontextprotocol/server-sequential-thinking@latest",

                "--max-thoughts=15",

                "--branch-limit=2",

                "--detail-level=low",

                "--revision-depth=3"

            ],

            "env": {

                "DISABLE_THOUGHT_LOGGING": "false"

            }

        },

        "memory": {

            "command": "npx",

            "args": [

                "-y",

                "mcp-knowledge-graph",

                "--memory-path",

                "/home/krwhynot/Projects/ForkFlow-crm/.knowledge"

            ]

        },

        "Context7": {

            "command": "npx",

            "args": ["-y", "@upstash/context7-mcp"]

        }

    }

}