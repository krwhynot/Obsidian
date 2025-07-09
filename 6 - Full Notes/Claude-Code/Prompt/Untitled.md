<Task> Scan a folder of `.md` files, extract metadata, and update `CLAUDE.md` with project references. </Task> 
<Inputs> {$DOCS_FOLDER_CONTENTS} {$CLAUDE_MD_CONTENT} </Inputs>

<Instructions> You are provided with:

1. A collection of `.md` files located in a `Docs/` folder    
2. An existing `CLAUDE.md` file that already contains structured content    

Your task is to:
1. **Scan all `.md` files** inside the provided folder    
2. From each file, **extract a meaningful title and 1–2 sentence description** based on headings and content    
3. Generate properly formatted `@filename` references compatible with **Claude Code AI**    
4. Update the provided `CLAUDE.md` by **appending a `## Project Reference` section** that lists each file as:    
    - `@filename` – _Title_: short description
    1. **Preserve all existing content** in `CLAUDE.md` — only append your new reference section to the end
✳️ Example entry format for each `.md` file:
`@auth_strategies.md – Authentication Strategies: Overview of supported login mechanisms including JWT, OAuth2, and SSO.`

Do **not remove or rewrite any existing sections** in `CLAUDE.md`. All additions should be appended cleanly below a new `## Project Reference` heading.

Begin now by processing the inputs below:  
<docs_folder>  
{$DOCS_FOLDER_CONTENTS}  
</docs_folder>

<claude_md>  
{$CLAUDE_MD_CONTENT}  
</claude_md>

</Instructions>