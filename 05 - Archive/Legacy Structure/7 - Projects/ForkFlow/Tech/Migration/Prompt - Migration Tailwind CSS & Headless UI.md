<Task> 
Analyze a front-end codebase to determine the current status of a migration from Material-UI to Tailwind CSS and Headless UI components.
</Task>

<Instructions> 
Scan the provided codebase and determine the current migration status from Material-UI to Tailwind CSS/Headless UI. Your analysis should include:

1. Number of files still importing from `@mui/material` or other Material-UI packages.
2. Identification of components that have already been migrated (e.g., Avatar, Typography, Button, etc.) to use Tailwind or a UI kit.
3. Usage patterns of new components or utility classes (e.g., `@/components/ui-kit`, Tailwind classnames).
4. Any inconsistencies or mixed usage that may indicate partial migration.

Then,  follow Complete foundational UI kit first strategies on findings:

Conclude your response with:
- A summary of your findings
- A recommended next step
- Optional: a checklist of migration candidates

Output your full analysis inside <analysis> tags.
</Instructions>




<Task> 
Analyze a front-end codebase to determine the current status of a migration from Material-UI to Tailwind CSS and Headless UI components.
</Task>

<Instructions> 
Scan the provided codebase and determine the current migration status from Material-UI to Tailwind CSS/Headless UI. Your analysis should include:

1. Number of files still importing from `@mui/material` or other Material-UI packages.
2. Identification of components that have already been migrated (e.g., Avatar, Typography, Button, etc.) to use Tailwind or a UI kit.
3. Usage patterns of new components or utility classes (e.g., `@/components/ui-kit`, Tailwind classnames).
4. Any inconsistencies or mixed usage that may indicate partial migration.

Then, use the following strategies on findings:
- A) Complete foundational UI kit first


Conclude your response with:
- A summary of your findings
- A recommended next step
- Optional: a checklist of migration candidates

Output your full analysis inside <analysis> tags.
</Instructions>





Focus on completing the migration of foundational UI kit components in all files:
- Replace all remaining usages of MUI’s Button, Card, Typography, Stack, Box, Dialog, Chip, Alert, Tooltip, Avatar, etc. with your UI kit equivalents.
- Remove all MUI imports for these components.
- Only after this, tackle advanced/specialized components (Stepper, Drawer, Fab, Badge, Select, etc.) with custom or Headless UI/Tailwind-based solutions.



==============

<Task> Audit a front-end codebase to verify the completeness of a migration from Material-UI to Tailwind CSS and Headless UI, ensuring all files are analyzed. </Task>

<Instructions> Thoroughly scan **every file** in the provided front-end codebase to assess the current state of the migration from Material-UI to Tailwind CSS and Headless UI. Your task is to determine whether the migration is complete and identify any remaining work. Your report must include:

1. Count of files still importing from `@mui/material` or related Material-UI packages.
    
2. A list of all foundational components (e.g. `Button`, `Typography`, `Card`, `Dialog`, `Avatar`, etc.) still using MUI and where.
    
3. Evidence of components that have already been migrated to Tailwind or a UI Kit (e.g. components from `@/components/ui-kit` or with Tailwind class usage).
    
4. Mixed usage patterns that indicate partial migration or inconsistencies.
    

Then, apply this strategy to your findings:  
**Prioritize completing foundational UI kit components first.**

- Replace remaining usages of MUI’s foundational components (`Button`, `Card`, `Typography`, `Stack`, `Box`, `Dialog`, `Chip`, `Alert`, `Tooltip`, `Avatar`, etc.) across **all files** with UI kit equivalents.
    
- Remove MUI imports for these components.
    
- Only after this foundational cleanup, tackle complex components like `Stepper`, `Drawer`, `Fab`, `Badge`, `Select`, etc. using custom, Headless UI, or Tailwind-based solutions.
    

Conclude your response with:

- A **summary** of your findings    
- A **recommended next step**    
- An optional **checklist of remaining migration candidates**
    

Wrap your entire output inside `<analysis>` tags.  
</Instructions>