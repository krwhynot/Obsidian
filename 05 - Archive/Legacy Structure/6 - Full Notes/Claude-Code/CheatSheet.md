
**Memory**
	**Project Memory Local** (`./CLAUDE.local.md`)
	**Project Memory** (`./CLAUDE.md`)
		**User Memory** (`~/.claude/CLAUDE.md`)

 **Essential CLAUDE.md File Structure and Best Practices**
 - clear project identification
 - core instructions
 - Project architectural references and common commands
 - coding style preferences with concrete examples
	
 **document reference pattern**
 ```
  # Key References
- Docker Architecture: `@docs/DOCKER_ARCHITECTURE.md`
- Database Schema: `@docs/DATABASE_SCHEMA.md` 
- Authentication Patterns: `@docs/JWT_AUTHENTICATION.md`
```

**TIp:**  placing long documents and inputs at the top of prompts, above queries and instructions, can improve response quality by up to 30%

When working with multiple documents, **XML tag structuring** provides clear organization that Claude can parse efficiently:

```xml
<documents>
  <document index="1">
    <source>project_specification.md</source>
    <document_content>
      {{PROJECT_SPECS}}
    </document_content>
  </document>
</documents>
```

A powerful technique involves **grounding responses in quotes** asking Claude to extract relevant quotes before performing analysis helps cut through document "noise" and improves accuracy
add memories with the `#`

## Token Management and Cost Control

**Conversation compacting** represents the most effective token reduction technique
	- Custom compaction instructions can be added to CLAUDE.md files to focus on specific content types during compression.
**Multi-session workflows** benefit from implementation planning documents that maintain context across conversation boundaries Creating handoff folders with structured context transfer enables complex projects to span multiple sessions without losing critical information.




claude  --dangerously-skip-permissions



