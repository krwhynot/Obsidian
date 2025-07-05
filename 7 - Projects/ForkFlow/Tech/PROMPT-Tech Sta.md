<Task> Rewrite the attached CRM UI/UX Prototype Structure, changing **only** the tech stack to the one provided below. Do **not** change anything else — all naming, logic, structure, or feature descriptions must remain untouched. </Task>

<Instructions> You are provided with a CRM UI/UX Prototype Structure. Your task is to **only update the tech stack** to reflect the dependencies below. Do **not** modify any other aspect of the document.

Here is the **replacement tech stack** you must apply:

---

## **Core Dependencies**

- **React & Ecosystem**    
    - `react`, `react-dom`: Core React library        
    - `react-admin`: Admin framework for React        
    - `react-router`, `react-router-dom`: Routing        
    - `react-hook-form`: Form management        
    - `react-error-boundary`: Error handling        
    - `react-window`, `react-window-infinite-loader`: Virtualized lists        
    - `react-intersection-observer`: Viewport detection        
    - `use-debounce`: Debouncing hooks
        
- **UI & Styling**    
    - `@headlessui/react`: Unstyled, accessible UI primitives        
    - `@heroicons/react`: SVG icon set        
    - `@radix-ui/react-checkbox`: Accessible checkbox        
    - `@tremor/react`: Data visualization components        
    - `tailwindcss`, `@tailwindcss/forms`, `@tailwindcss/typography`: Utility-first CSS framework and plugins        
    - `tailwind-merge`: Utility class merging        
    - `clsx`: Conditional classNames
        
- **Drag & Drop**    
    - `@dnd-kit/core`, `@dnd-kit/sortable`: Drag-and-drop utilities        
    - `@hello-pangea/dnd`: Alternative drag-and-drop
        
- **Data & State**
    - `@tanstack/react-query`: Data fetching and caching        
    - `react-query`: (older version, may be legacy)        
    - `lodash`: Utility functions        
    - `date-fns`: Date utilities        
    - `papaparse`: CSV parsing
        
- **Google Maps**    
    - `@googlemaps/react-wrapper`, `@react-google-maps/api`: Google Maps integration        
    - `@types/google.maps`: TypeScript types
        
- **Supabase**
    - `@supabase/supabase-js`: Supabase client        
    - `ra-supabase`: React-admin data provider for Supabase
        
- **Other**    
    - `.env`: Environment variable management        
    - `faker`, `@faker-js/faker`: Fake data generation        
    - `serve`: Static file serving
--
## **DevDependencies & Tooling**
- **Testing**
    - `@playwright/test`, `playwright`: E2E testing        
    - `@testing-library/react`, `@testing-library/jest-dom`, `@testing-library/user-event`: Component testing        
    - `vitest`, `@vitest/browser`, `@vitest/coverage-v8`: Unit testing        
    - `@axe-core/playwright`: Accessibility testing
        
- **Storybook**    
    - `storybook`, `@storybook/react-vite`, `@storybook/addon-*`: Component documentation/testing
        
- **Build & Lint**    
    - `vite`, `@vitejs/plugin-react`, `@tailwindcss/vite`, `vite-plugin-dts`: Build tools        
    - `typescript`: TypeScript support        
    - `eslint`, `eslint-*`, `prettier`, `lint-staged`: Linting and formatting
        
- **Database**    
    - `pg`: PostgreSQL client (for Supabase)        
    - `@types/pg`: TypeScript types
        
- **Other**    
    - `autoprefixer`: CSS vendor prefixing        
    - `gh-pages`: GitHub Pages deployment        
    - `execa`: Process execution        
    - `ink`: CLI UI        
    - `replace-in-file`: File replacement        
    - `rollup-plugin-visualizer`: Bundle analysis
 ---

**Important**: Do not add, remove, or rewrite any content from the prototype structure aside from replacing the existing tech stack. Preserve original descriptions, formatting, and design language.

Write the final output inside `<updated_prototype>` tags.  
</Instructions>