Here is a **full checklist** of all files still importing from `@mui/material` or `@mui/icons-material`, including the specific lines where the imports occur. You can use this as a migration tracker:

---

### 📝 Migration Checklist: Remove MUI Imports
**Instructions:**  
- Check off each file as you migrate it away from MUI.
- For each line, replace the MUI import with the appropriate UI kit or icon library import, and refactor usage as needed.
- For each target file, replace MUI components with UI kit equivalents.
- Refactor props and styles to match the new system.
- Remove MUI-specific props (e.g., `variant`, `gutterBottom`).
- After all files are migrated, delete all `@mui/material` and `@mui/icons-material` imports.
 