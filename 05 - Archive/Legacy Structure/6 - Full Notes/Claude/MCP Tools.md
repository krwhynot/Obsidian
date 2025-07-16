
  
For prompts use the following MCP tools when needed: brave_web_search file_systems sequentialthinking

### add_observations

Add new observations to existing entities in the knowledge graph

From server: memory

### brave_local_search

Searches for local businesses and places using Brave's Local Search API. Best for queries related to physical locations, businesses, restaurants, services, etc. Returns detailed information including: - Business names and addresses - Ratings and review counts - Phone numbers and opening hours Use this when the query implies 'near me' or mentions specific locations. Automatically falls back to web search if no local results are found.

From server: brave-search

### brave_web_search

Performs a web search using the Brave Search API, ideal for general queries, news, articles, and online content. Use this for broad information gathering, recent events, or when you need diverse web sources. Supports pagination, content filtering, and freshness controls. Maximum 20 results per request, with offset for pagination.

From server: brave-search

### create_directory

Create a new directory or ensure a directory exists. Can create multiple nested directories in one operation. If the directory already exists, this operation will succeed silently. Perfect for setting up directory structures for projects or ensuring required paths exist. Only works within allowed directories.

From server: filesystem

### create_entities

Create multiple new entities in the knowledge graph

From server: memory

### create_relations

Create multiple new relations between entities in the knowledge graph. Relations should be in active voice

From server: memory

### delete_entities

Delete multiple entities and their associated relations from the knowledge graph

From server: memory

### delete_observations

Delete specific observations from entities in the knowledge graph

From server: memory

### delete_relations

Delete multiple relations from the knowledge graph

From server: memory

### directory_tree

Get a recursive tree view of files and directories as a JSON structure. Each entry includes 'name', 'type' (file/directory), and 'children' for directories. Files have no children array, while directories always have a children array (which may be empty). The output is formatted with 2-space indentation for readability. Only works within allowed directories.

From server: filesystem

### edit_file

Make line-based edits to a text file. Each edit replaces exact line sequences with new content. Returns a git-style diff showing the changes made. Only works within allowed directories.

From server: filesystem

### get_file_info

Retrieve detailed metadata about a file or directory. Returns comprehensive information including size, creation time, last modified time, permissions, and type. This tool is perfect for understanding file characteristics without reading the actual content. Only works within allowed directories.

From server: filesystem



### list_allowed_directories

Returns the list of directories that this server is allowed to access. Use this to understand which directories are available before trying to access files.

From server: filesystem

### list_directory

Get a detailed listing of all files and directories in a specified path. Results clearly distinguish between files and directories with [FILE] and [DIR] prefixes. This tool is essential for understanding directory structure and finding specific files within a directory. Only works within allowed directories.

From server: filesystem

### move_file

Move or rename files and directories. Can move files between directories and rename them in a single operation. If the destination exists, the operation will fail. Works across different directories and can be used for simple renaming within the same directory. Both source and destination must be within allowed directories.

From server: filesystem

### open_nodes

Open specific nodes in the knowledge graph by their names

From server: memory

### read_file

Read the complete contents of a file from the file system. Handles various text encodings and provides detailed error messages if the file cannot be read. Use this tool when you need to examine the contents of a single file. Only works within allowed directories.

From server: filesystem

### read_graph

Read the entire knowledge graph

From server: memory

### read_multiple_files

Read the contents of multiple files simultaneously. This is more efficient than reading files one by one when you need to analyze or compare multiple files. Each file's content is returned with its path as a reference. Failed reads for individual files won't stop the entire operation. Only works within allowed directories.

From server: filesystem

### search_files

Recursively search for files and directories matching a pattern. Searches through all subdirectories from the starting path. The search is case-insensitive and matches partial names. Returns full paths to all matching items. Great for finding files when you don't know their exact location. Only searches within allowed directories.

From server: filesystem

### search_nodes

Search for nodes in the knowledge graph based on a query

From server: memory

### sequentialthinking

A detailed tool for dynamic and reflective problem-solving through thoughts. This tool helps analyze problems through a flexible thinking process that can adapt and evolve. Each thought can build on, question, or revise previous insights as understanding deepens. When to use this tool: - Breaking down complex problems into steps - Planning and design with room for revision - Analysis that might need course correction - Problems where the full scope might not be clear initially - Problems that require a multi-step solution - Tasks that need to maintain context over multiple steps - Situations where irrelevant information needs to be filtered out Key features: - You can adjust total_thoughts up or down as you progress - You can question or revise previous thoughts - You can add more thoughts even after reaching what seemed like the end - You can express uncertainty and explore alternative approaches - Not every thought needs to build linearly - you can branch or backtrack - Generates a solution hypothesis - Verifies the hypothesis based on the Chain of Thought steps - Repeats the process until satisfied - Provides a correct answer Parameters explained: - thought: Your current thinking step, which can include: * Regular analytical steps * Revisions of previous thoughts * Questions about previous decisions * Realizations about needing more analysis * Changes in approach * Hypothesis generation * Hypothesis verification - next_thought_needed: True if you need more thinking, even if at what seemed like the end - thought_number: Current number in sequence (can go beyond initial total if needed) - total_thoughts: Current estimate of thoughts needed (can be adjusted up/down) - is_revision: A boolean indicating if this thought revises previous thinking - revises_thought: If is_revision is true, which thought number is being reconsidered - branch_from_thought: If branching, which thought number is the branching point - branch_id: Identifier for the current branch (if any) - needs_more_thoughts: If reaching end but realizing more thoughts needed You should: 1. Start with an initial estimate of needed thoughts, but be ready to adjust 2. Feel free to question or revise previous thoughts 3. Don't hesitate to add more thoughts if needed, even at the "end" 4. Express uncertainty when present 5. Mark thoughts that revise previous thinking or branch into new paths 6. Ignore information that is irrelevant to the current step 7. Generate a solution hypothesis when appropriate 8. Verify the hypothesis based on the Chain of Thought steps 9. Repeat the process until satisfied with the solution 10. Provide a single, ideally correct answer as the final output 11. Only set next_thought_needed to false when truly done and a satisfactory answer is reached

From server: sequential-thinking

### sequentialthinking

A detailed tool for dynamic and reflective problem-solving through thoughts. This tool helps analyze problems through a flexible thinking process that can adapt and evolve. Each thought can build on, question, or revise previous insights as understanding deepens. When to use this tool: - Breaking down complex problems into steps - Planning and design with room for revision - Analysis that might need course correction - Problems where the full scope might not be clear initially - Problems that require a multi-step solution - Tasks that need to maintain context over multiple steps - Situations where irrelevant information needs to be filtered out Key features: - You can adjust total_thoughts up or down as you progress - You can question or revise previous thoughts - You can add more thoughts even after reaching what seemed like the end - You can express uncertainty and explore alternative approaches - Not every thought needs to build linearly - you can branch or backtrack - Generates a solution hypothesis - Verifies the hypothesis based on the Chain of Thought steps - Repeats the process until satisfied - Provides a correct answer Parameters explained: - thought: Your current thinking step, which can include: * Regular analytical steps * Revisions of previous thoughts * Questions about previous decisions * Realizations about needing more analysis * Changes in approach * Hypothesis generation * Hypothesis verification - next_thought_needed: True if you need more thinking, even if at what seemed like the end - thought_number: Current number in sequence (can go beyond initial total if needed) - total_thoughts: Current estimate of thoughts needed (can be adjusted up/down) - is_revision: A boolean indicating if this thought revises previous thinking - revises_thought: If is_revision is true, which thought number is being reconsidered - branch_from_thought: If branching, which thought number is the branching point - branch_id: Identifier for the current branch (if any) - needs_more_thoughts: If reaching end but realizing more thoughts needed You should: 1. Start with an initial estimate of needed thoughts, but be ready to adjust 2. Feel free to question or revise previous thoughts 3. Don't hesitate to add more thoughts if needed, even at the "end" 4. Express uncertainty when present 5. Mark thoughts that revise previous thinking or branch into new paths 6. Ignore information that is irrelevant to the current step 7. Generate a solution hypothesis when appropriate 8. Verify the hypothesis based on the Chain of Thought steps 9. Repeat the process until satisfied with the solution 10. Provide a single, ideally correct answer as the final output 11. Only set next_thought_needed to false when truly done and a satisfactory answer is reached

From server: server-sequential-thinking

### write_file

Create a new file or completely overwrite an existing file with new content. Use with caution as it will overwrite existing files without warning. Handles text content with proper encoding. Only works within allowed directories.

From server: filesystem