<Task> Create a complete code dependency mapping for the ForkFlow CRM codebase using the following tools for analysis and visualization. </Task>

<Instructions> You are tasked with generating code dependency insights using the following tools and their exact configurations. The goal is to analyze module coupling, detect circular dependencies, and visualize the React component hierarchy.
---
### 🔍 Tools to Use
#### 1. **Dependency Cruiser**
- Detects overall dependency structure    
- Outputs graph visualizations   
- 
Run the following setup and command sequence:
bash
CopyEdit
`npm install --save-dev dependency-cruiser npx depcruise --init npx depcruise src --include-only "^src" --output-type dot | dot -T svg > dependency-graph.svg`

#### 2. **Madge** (for circular dependency detection)
Install globally:
bash
CopyEdit
`npm install --global madge`
Run:
bash
CopyEdit
`madge --circular --ts-config ./tsconfig.json --extensions ts,tsx src/`

#### 3. **TS-Dependency-Graph** (for React component hierarchy)
Install globally:
bash
CopyEdit
`npm i ts_dependency_graph -g`
Run:
bash
CopyEdit
`ts_dependency_graph --start src/index.tsx --mermaid`

---

### 🧠 Implementation Strategy for ForkFlow CRM
Your CRM uses:
- **React + react-admin**    
- **Supabase for backend**    
- **Complex feature modules (e.g., leads, tasks, pipelines, dashboards)**
    
Follow this multi-phase implementation plan:

#### Phase 1: Basic Setup
- Set up all tools listed above in the project root.    
- Generate baseline visualizations and output:
    - `dependency-graph.svg` using Dependency Cruiser        
    - Circular dependency report using Madge        
    - Component hierarchy diagram using TS-Dependency-Graph (Mermaid format)

#### Phase 2: Module Diagnosis
- Identify and list all circular dependencies across CRM modules (e.g., Tasks ↔️ Leads).    
- Suggest where structure refactoring may be required (e.g., splitting shared logic into a `core` or `common` folder).    
- Flag over-coupled areas or files with excessive imports.

#### Phase 3: Output Format
- Include:    
    - A Markdown summary of your findings and visual links        
    - Inline `code blocks` showing example command outputs (e.g., circular dependency trees)        
    - Embed or reference `dependency-graph.svg` and Mermaid code snippets        
    - A clear checklist of recommended refactors        

Write the full report inside `<dependency_analysis>` tags.

</Instructions>