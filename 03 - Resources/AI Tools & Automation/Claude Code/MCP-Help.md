<Task> Convert the output of `supabase MCP server --help` into clear, concise project-relevant Markdown documentation and write it to `claude.md`. </Task>
<Inputs> {$HELP_OUTPUT} </Inputs>
<Instructions> Use the given help text to create a well-structured Markdown reference. Your documentation should include: 
- Title: `supabase MCP Server – Help Reference` 
- **Usage** section 
- **Commands** (if present) 
- **Flags/Options** 

Write the final Markdown inside `<markdown>` tags and save it by modifying `claude.md`.  
</Instructions>