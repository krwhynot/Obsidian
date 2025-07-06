### 🧰 Tools & Usage Instructions

#### ✅ Sass Graph (SCSS/Sass `@import` Dependencies)
bash
CopyEdit
`npm install --save-dev sass-graph ./bin/sassgraph descendants src/styles src/styles/main.scss`
- Show ancestor and descendant imports    
- Output dependency graph in JSON

#### ✅ dependency-analyze (CSS/JS Mix)
javascript
CopyEdit
`const analyze = require('dependency-analyze'); analyze.parseCSS(cssCode);`
- Parse CSS @import statements and dependency trees    
- Apply to SCSS, CSS, Less files

#### ✅ Import Graph (Multi-pattern Dependency Mapper)
- Support SCSS @import, ES6 imports, CommonJS    
- Traverse ancestor/descendant trees    
- Apply custom regex patterns if needed

#### ✅ CSS Modules Analysis
- Map local-to-global class names    
- Track component/module boundaries    
- Analyze import/export paths across components

#### ✅ Styled Components Analysis
- Detect `ThemeProvider` relationships    
- Trace styled-component extensions    
- Map prop-based dynamic styles

#### ✅ Tailwind CSS Mapping
- Use `twmap` to extract utility class usage from JSX/TSX    
- Use `tailwind-mappings` to translate CSS properties to Tailwind equivalents    
- Visualize most-used utility patterns across components    

#### ✅ Bundle & Runtime Style Impact
- Run Webpack Bundle Analyzer or Vite plugin equivalents    
- Track which styles go into which bundle    
- Highlight dead/duplicate/unreachable CSS    

#### ✅ Visualization Tools
- Generate SVG graphs (via Sass Graph or Import Graph)    
- Use D3.js or force-directed layout libraries for style dependency exploration    
- Optionally export a style tree like:   
text
CopyEdit
`styles/ ├── base/ ├── components/ ├── utilities/ └── main.scss`

---

### 📊 Final Output Should Include:

1. **SCSS & CSS Import Graphs**    
    - Inline diagrams or embedded SVGs from Sass Graph & dependency-analyze

2. **CSS Modules Map**    
    - ClassName mapping and scoped styling relationships       

3. **Tailwind Utility Map**    
    - Most frequent utility chains, layout composition patterns

4. **Styled Component Tree**    
    - ThemeProvider chains and style extension flow

5. **Layout Component Hierarchy**    
    - Style boundaries across layout shells (e.g., `AppShell`, `Sidebar`, `PageContainer`)
        
6. **Bundle Analysis Snapshot**    
    - Bundle size attributed to styles (per chunk/component)

7. **Recommendations**    
    - Suggestions for cleanup, optimization, or dead CSS removal

Wrap your full report inside `<style_dependency_analysis>` tags.

</Instructions>