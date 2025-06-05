**You are an expert Python software architect with a deep understanding of project structure optimization. I have a Python-based image processing application with a user interface (UI) designed for the restaurant industry. The project helps convert logo files between different formats while preserving quality and consistency.**

**Your task is to analyze the project's file structure, identify unnecessary complexity, redundant files, or poor organization, and suggest a clean, scalable structure.**

---

### **Instructions:**

1. **Analyze the Current File Structure**
    - Read through all project files and directories.
    - Identify duplicate, redundant, or misplaced files.
    - Check for unnecessary clutter in the root directory.
    - Look for fragmented utility functions that can be consolidated.
2. **Identify the Core Components**
    - Locate the main logic for **image processing** (e.g., conversion, quality management).
    - Find **UI-related files** (e.g., web-based or desktop-based interface).
    - Identify **configuration and settings** files.
    - Check for **scripts or CLI utilities** that may need reorganization.
3. **Check for Standardization Issues**
    - Ensure proper package structuring with `__init__.py` files.
    - Verify module names follow Python best practices (lowercase with underscores).
    - Identify any large files that should be split for modularity.
4. **Evaluate Directory Naming & Placement**
    - Ensure core modules (image processing, UI, utils) are clearly separated.
    - Move misplaced files to the appropriate directory.
    - Suggest renaming folders or merging fragmented subdirectories.
5. **Optimize Dependency Management**
    - Review dependency files (`requirements.txt`, `pyproject.toml`, `Pipfile`).
    - Identify unused dependencies that can be removed.
    - Check if the dependency management strategy is appropriate.
6. **Suggest a Clean File Structure**
    - Propose an improved directory layout that enhances clarity and maintainability.
    - Provide a concise explanation for each restructuring suggestion.
    - Highlight any missing best practices (e.g., moving config files, test structure).
7. **Identify Potential Performance & Code Cleanup Areas**
    - Flag unnecessary large files that should be externalized or refactored.
    - Check for duplicated functionality across different files.
    - Suggest better modularization to improve reusability.

---

**Deliverables:**

- A detailed analysis of structural inefficiencies.
- A proposed clean and well-organized directory layout.
- Recommended changes with justifications.
- Any missing elements that should be added (e.g., docs, tests, CI/CD setup).

**Optional:** If applicable, identify a refactoring strategy for key files.


# Create File Structure Doc
I need a well-structured **FILE_STRUCTURE.md** (or **ARCHITECTURE.md**) document for my coding project. The purpose of this document is to explain the project's directory structure, the role of each file and folder, and how different components interact.

### Requirements:
1. **Tree-Like Directory Representation**  
   - Generate a hierarchical tree structure of the project directory.
   - Use proper indentation to show nested files and folders.

2. **Explanation of Each File and Folder**  
   - Provide a clear and concise description of the purpose of each file and folder.
   - Group related files (e.g., all configuration files, all API-related files).

3. **How Files Interact with Each Other**  
   - Describe the logical flow of the application.
   - Explain how different files communicate (e.g., "routes.py calls functions from controllers/user.py, which fetches data from models.py").
   - If applicable, mention dependencies between files or modules.

4. **Example Code Snippets (if needed)**  
   - Provide short examples to illustrate how files interact.
   - Show function imports or class relationships to clarify dependencies.

5. **Use Markdown Formatting Properly**  
   - Use `#` for headings, `-` for bullet points, and ```` ``` ```` for code snippets.
   - Ensure the document is easy to read and well-structured.

The goal is to **help new developers quickly understand the project structure** and how different files work together. The explanations should be detailed but clear and beginner-friendly.

