
create a file-structure-README.md file for this project similar to this: **project folder structure** A well-organized project folder structure is 
  critical for visual learners to maintain clarity throughout development. For a front-end application, a feature-based structure might look like this:
  ```
  project-root/
  ├── components/       # Shared components
  ├── composables/      # Shared composables
  ├── config/           # Application configuration
  ├── features/         # Feature-specific code
  │   ├── authentication/
  │   │   ├── components/
  │   │   ├── services/
  │   │   └── stores/
  │   └── dashboard/
  │       ├── components/
  │       └── services/
  ├── layouts/          # Page layouts
  ├── lib/              # Third-party configurations
  ├── pages/            # Application pages
  ├── services/         # Shared services
  ├── stores/           # Global state stores
  └── test/             # Testing utilities

  ```


**Tech-Debt MD File**
Review all the code files in this project and provide the following:

  1. A **summary** of each file's purpose and functionality.
  2. Identification of any **incomplete functionality** or **missing features** based on the context of the project.
  3. Suggestions for **improvements or optimizations** in the code (e.g., performance, readability, modularity).
  4. Highlight any **technical debt** or areas that require refactoring.
  5. Detect any **broken or outdated dependencies**, and flag related files.
  6. Suggest **next steps** for completion of the project and achieving the intended goals.

  In a  techincal-debt-README.md file Provide the results in a clear and structured format with actionable recommendations.

**README.md PROMPT**

**Task:**  
  Create a detailed README file that outlines the order of operations for the system, specifying which files it utilizes and describing the functions in 
  each file.

  **Requirements:**

  1. **Order of Operations**
      
      - Clearly describe the sequence in which files are accessed and utilized during execution.
      - Explain dependencies between files and their execution flow.
  2. **File Descriptions**
      
      - List each file with its **full file path**.
      - Provide a summary of its purpose.
      - Detail the key functions it contains, their roles, and how they contribute to the system.
  3. **Output Format**
      
      - Use a structured format, such as:
          
          ```markdown
          ## Order of Operations
          1. File A (`/path/to/fileA`): [Description]
             - Function 1: [Purpose]
             - Function 2: [Purpose]
          2. File B (`/path/to/fileB`): [Description]
             - Function 3: [Purpose]
          ```
          
      - Optionally include code snippets or examples where relevant.

  **Additional Context:**

  - Assume the audience has **technical expertise** and is familiar with the programming environment but may not be aware of the specific implementation 
  details.
  - Maintain clarity and conciseness while ensuring completeness.



