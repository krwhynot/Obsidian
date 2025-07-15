
##### Claude Prompt (Full Code Analysis + Markdown Output)
```markdown

<Task>
Analyze the full code of a Dashboard/Home page and generate a complete Markdown-formatted design summary. The goal is to allow a developer to create new standalone components that visually and behaviorally match the existing page.
</Task>

<Inputs>
<code_bundle>
Review actual code of the pagein the project, including HTML, CSS (inline or external), and relevant affecting layout, interaction, or visual design.
</code_bundle>
</Inputs>

<Instructions>
You will receive the **full source code** (HTML, CSS, JS) for a web dashboard or homepage.

Your task is to extract and interpret all visual, structural, and behavioral patterns from the code and produce a detailed design report formatted in **Markdown**, suitable for copying into a `.md` file or Markdown-aware terminal/editor.

The output must follow this structure:
---
### 1. Design Style Overview
- Describe the design system or aesthetic (e.g., Material, Tailwind, custom, minimalist)
- Font stack, sizing scale, icon use, animation presence
- General mood (professional, playful, neutral, etc.)
---
### 2. Color Scheme
- Extract all color variables/classes used (from CSS or inline styles)
- Organize into:
  - Primary Colors
  - Secondary/Accent
  - Backgrounds
  - Borders/Text
- Mention usage context (e.g., buttons, alerts, nav, backgrounds)
---
### 3. UI Components Breakdown
For each major component:
- **Name**
- **Role** on the page
- **Markup structure** (e.g., HTML tags used)
- **Styling classes or custom CSS**
- **Dynamic behavior** from JS (e.g., toggle, load-on-click, scroll animation)
- Include brief code snippets if helpful
---
### 4. Layout System & Structure
- Describe layout strategy: grid/flex/float/CSS framework (e.g., Tailwind, Bootstrap)
- Page flow: header, sidebar, content, footer, etc.
- Margin/padding rhythm, alignment logic
- Responsive rules (media queries, breakpoints)
---
###  5. Design Consistency Blueprint (for New Components)
Create a ruleset to guide creation of new standalone components that feel native to this dashboard:
- Typography rules
- Component spacing & sizing units
- Color & shadow usage
- Border radius, hover/focus patterns
- JS interaction/animation guidelines
---
### Output Format Notes
- Output must be **pure Markdown**, valid in `.md` or Markdown-compatible terminal
- Use `###`, bullet points, and triple-backtick blocks for any code references
- No HTML or JSX formatting unless shown as a code snippet
- Do not include unnecessary descriptions — aim for use by frontend developers

Begin your Markdown analysis based on the code bundle provided.
</Instructions>
```

