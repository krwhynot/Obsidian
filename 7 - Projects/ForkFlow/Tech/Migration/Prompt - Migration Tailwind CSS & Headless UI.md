<Task> 
Analyze a front-end codebase to determine the current status of a migration from Material-UI to Tailwind CSS and Headless UI components.
</Task>

<Instructions> 
Scan the provided codebase and determine the current migration status from Material-UI to Tailwind CSS/Headless UI. Your analysis should include:

1. Number of files still importing from `@mui/material` or other Material-UI packages.
2. Identification of components that have already been migrated (e.g., Avatar, Typography, Button, etc.) to use Tailwind or a UI kit.
3. Usage patterns of new components or utility classes (e.g., `@/components/ui-kit`, Tailwind classnames).
4. Any inconsistencies or mixed usage that may indicate partial migration.

Then, usethe following strategies on findings:
- A) Complete foundational UI kit first


Conclude your response with:
- A summary of your findings
- A recommended next step
- Optional: a checklist of migration candidates

Output your full analysis inside <analysis> tags.
</Instructions>
