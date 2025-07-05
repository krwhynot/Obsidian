```bash
npm ls --all --depth=0 | cat
```
```bash
npm list --depth=0 --json
```
Read file: package.json
Here is a comprehensive list of your current dependencies and similar tech stack components, based on your `package.json`:

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
  - `@nivo/bar`, `@nivo/core`: Charting
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
  - `dotenv`: Environment variable management
  - `faker`, `@faker-js/faker`: Fake data generation
  - `prop-types`: Runtime type checking
  - `serve`: Static file serving

---

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

## **Similar/Related Tech Stack Components**

- **UI Libraries**
  - `@headlessui/react`, `@radix-ui/react-checkbox`, `@tremor/react`, `@nivo/bar`, `@nivo/core`
- **Icon Libraries**
  - `@heroicons/react`
- **Admin/Data Providers**
  - `react-admin`, `ra-supabase`, `ra-data-fakerest`, `ra-data-json-server`
- **Testing**
  - `playwright`, `@testing-library/*`, `vitest`
- **Build Tools**
  - `vite`, `typescript`, `rollup-plugin-visualizer`
- **State/Data**
  - `@tanstack/react-query`, `react-query`, `lodash`, `date-fns`
- **Maps**
  - `@googlemaps/react-wrapper`, `@react-google-maps/api`
- **Drag & Drop**
  - `@dnd-kit/core`, `@dnd-kit/sortable`, `@hello-pangea/dnd`

---

## **Summary Table**

| Category         | Main Packages/Tools                                                                 |
|------------------|-------------------------------------------------------------------------------------|
| UI Components    | @headlessui/react, @radix-ui/react-checkbox, @tremor/react, @nivo/bar, tailwindcss |
| Icons            | @heroicons/react                                                                   |
| Admin Framework  | react-admin, ra-supabase, ra-data-fakerest, ra-data-json-server                    |
| State/Data       | @tanstack/react-query, react-query, lodash, date-fns                               |
| Maps             | @googlemaps/react-wrapper, @react-google-maps/api                                  |
| Drag & Drop      | @dnd-kit/core, @dnd-kit/sortable, @hello-pangea/dnd                                |
| Testing          | playwright, @testing-library/react, vitest                                         |
| Build/Tooling    | vite, typescript, rollup-plugin-visualizer, eslint, prettier                       |
| Database         | @supabase/supabase-js, pg                                                          |

---

If you need a more detailed breakdown (e.g., by version, or want to know which are used for production vs. dev), let me know!