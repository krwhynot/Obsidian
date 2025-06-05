Analyze the entire project for the following:

1. Identify any **duplicate files** or **duplicate functions** across the codebase.
    
    - Specify the file paths where duplicates are located.
    - Provide a summary of the duplicated content and suggestions for consolidation or reuse.
2. Detect any **missing files** or **functions** based on the project structure, references, or intended functionality.
    
    - Highlight unresolved references, missing imports, or calls to undefined functions.
    - Suggest what needs to be added or fixed to resolve these issues.
3. Provide an organized report with:
    
    - A section for duplicates (files and functions).
    - A section for missing files or functions.
    - Actionable recommendations to address each issue.

Ensure the analysis is thorough and context-aware, considering typical patterns in this project's architecture.



------
Review all the code files in this project and provide the following:

1. A **summary** of each file's purpose and functionality.
2. Identification of any **incomplete functionality** or **missing features** based on the context of the project.
3. Suggestions for **improvements or optimizations** in the code (e.g., performance, readability, modularity).
4. Highlight any **technical debt** or areas that require refactoring.
5. Detect any **broken or outdated dependencies**, and flag related files.
6. Suggest **next steps** for completion of the project and achieving the intended goals.

Provide the results in a clear and structured format with actionable recommendations.


# CLAUDE PROMPT
#### **Objective:**

Analyze all project files to assess progress, identify pending tasks, and recommend next steps based on the development roadmap. Utilize available MCP tools to enhance efficiency in data collection, organization, and analysis.

#### **Instructions:**

1. **Scan all project files**, including code, documentation, backlog, and issue trackers.
    - Use `list_directory` and `directory_tree` to get a structured view of project files.
    - Use `read_multiple_files` to extract content efficiently.
2. **Summarize current progress**, identifying completed, in-progress, and pending tasks.
    - Leverage `search_files` to locate relevant files (e.g., `TODO`, `README`, issue trackers).
3. **Identify blockers, inefficiencies, or gaps** in the current implementation.
    - Use `sequentialthinking` to analyze project challenges and iterate solutions.
4. **Propose next logical steps**, prioritizing tasks based on structure and roadmap.
5. **Suggest optimizations** for better maintainability, performance, or workflow improvements.

#### **Scope of Analysis:**

- **Backend:** 
- **Frontend:**
- **Database:** 
- **Task Management:** 

#### **Output Format:**

- **Project Status Overview:** % completion, key milestones.
- **In-Progress Work:** Active tasks and their status.
- **Pending Work:** Tasks not yet started.
- **Issues & Blockers:** Roadblocks preventing progress.
- **Next Steps:** Prioritized action items with estimated effort.
- **Optimization Suggestions:** Architecture, performance, or workflow improvements.

#### **Constraints & Considerations:**

- Follow **Repository Pattern**.
- Maintain **coding standards and file structure** consistency.
- Ensure recommendations align with **scalability and maintainability goals**.
- Utilize tools like `add_observations` and `create_entities` to track insights in a structured knowledge graph.