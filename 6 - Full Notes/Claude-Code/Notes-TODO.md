- **teach claude to use your tools** 
```markdown

<Task> Convert the output of `sequential-thinking MCP server --help` into clear, concise project-relevant Markdown documentation and write it to `claude.md`. </Task>
<Inputs> {$HELP_OUTPUT} </Inputs>
<Instructions> Use the given help text to create a well-structured Markdown reference. Your documentation should include: 
- Title: `sequential-thinking MCP Server – Help Reference` 
- Brief intro 
- **Usage** section 
- **Commands** (if present) 
- **Flags/Options** 
- **Examples** — always include simple, realistic examples based on current project context 
- Optional **Notes**

Write the final Markdown inside `<markdown>` tags and save it by modifying `claude.md`.  
</Instructions>

```


                "STORAGE_PATH": "/home/krwhynot/Projects/ForkFlow-crm/.knowledge",

                "MCP_LOG_LEVEL": "info"