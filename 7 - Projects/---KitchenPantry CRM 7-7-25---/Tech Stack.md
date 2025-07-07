| **Feature / UI Element**                      | **Tech / Library**                                                             |
| --------------------------------------------- | ------------------------------------------------------------------------------ |
| **Authentication & Onboarding**               | Supabase Auth, `@supabase/supabase-js`, Tailwind, Headless UI                  |
| Session persistence, logout after inactivity  | Supabase Auth + Client SDK                                                     |
| Multi-provider login UI                       | Tailwind CSS, Headless UI, React                                               |
|                                               |                                                                                |
| **Dashboard (KPIs, Charts, Recent Activity)** | Tremor (`@tremor/react`), Tailwind, React, `@tanstack/react-query`             |
| Priority badge system (A–D)                   | Tailwind (color system), Custom `PriorityBadge` Component                      |
| Quick actions & overlays                      | Headless UI (Dialog/Modal), React components                                   |
|                                               |                                                                                |
| **Organization & Contact Management**         | react-admin, ra-supabase, Supabase, Tailwind, `@tanstack/react-query`          |
| Search, filters, pagination, sorting          | react-admin DataProvider, Supabase queries, `react-query`                      |
| Detail views (tabs, cards, forms)             | Headless UI (Tabs, Cards), Tailwind                                            |
| Bulk actions                                  | react-admin + custom bulk action components                                    |
| Swipe gestures (mobile)                       | React gesture libraries _(optional)_ or native touch event handlers            |
|                                               |                                                                                |
| **Interaction Timeline & Activity Feed**      | Supabase (Realtime or Fetched), `@tanstack/react-query`, Tailwind, Tremor      |
| Activity stream with filters                  | Tailwind, react-query filters, Headless UI                                     |
| Infinite scroll for timelines                 | `react-window`, `react-intersection-observer`                                  |
|                                               |                                                                                |
| **Interaction Entry / Follow-Up Scheduling**  | react-hook-form, zod, Headless UI, Tailwind                                    |
| Quick add modals, validation                  | Dialog components + `@hookform/resolvers`, zod                                 |
| Date/time pickers                             | Radix UI, Headless UI, or 3rd party pickers (flatpickr)                        |
|                                               |                                                                                |
| **Maps & GPS Location Tracking**              | Google Maps API, `@react-google-maps/api`, `@googlemaps/react-wrapper`         |
| Map markers, zoom, place search               | Google Maps API features + Supabase coordinates                                |
|                                               |                                                                                |
| **Excel Migration System**                    | PapaParse, `@dnd-kit/*`, React, Tailwind, zod                                  |
| CSV parsing, field mapping UI                 | PapaParse + custom React drag/drop mapping interface                           |
| Confidence scoring visuals                    | Tailwind UI + basic scoring heuristics                                         |
|                                               |                                                                                |
| **Settings & Preferences**                    | React, Headless UI, Tailwind, Supabase Auth (user metadata), Switch components |
| Theme toggle, language selector               | Tailwind (theming), i18n library (optional)                                    |
| Admin settings, access control                | Supabase RLS, React context, Supabase Auth roles                               |
|                                               |                                                                                |
| **Modals, Transitions, Feedback**             | Headless UI (Dialog), Radix UI, Tailwind transitions, `@heroicons/react`       |
| Toast notifications                           | Headless UI or 3rd-party toast lib (e.g., `react-hot-toast`)                   |
|                                               |                                                                                |
| **Data Handling & Caching**                   | `@tanstack/react-query` for queries/mutations/caching                          |
| Optimistic updates, retries, background sync  | React Query built-in mechanisms                                                |
| Offline support (critical paths)              | React Query + localStorage fallback strategy _(customizable)_                  |
|                                               |                                                                                |
| **Accessibility & Touch Standards**           | Headless UI, Radix UI, Tailwind, WCAG design tokens                            |
| 48–56px touch targets, keyboard nav           | Tailwind spacing + semantic components                                         |
|                                               |                                                                                |
| **Testing & QA**                              | Playwright, @testing-library/react, Vitest, @axe-core/playwright               |
| E2E mobile/tablet testing                     | Playwright (device emulation & touch support)                                  |
| Component and form testing                    | Testing Library + Vitest                                                       |



### ✅ **Frontend**
- **React** (with **TypeScript**)    
- **Vite** as the build tool    
- **Tailwind CSS** for utility-first styling    
- **@headlessui/react** for accessible UI primitives    
- **@heroicons/react** for icons    
- **@tremor/react** for data visualizations    
- **@radix-ui/react-checkbox** for form components    
- **react-admin** for CRUD admin UI    
- **@tanstack/react-query** for data fetching & caching    
- **react-hook-form** for form management    
- **zod** + `@hookform/resolvers` for schema validation    
- **react-router-dom** for routing    
- **react-error-boundary** for graceful error handling    
- **react-window** & **react-window-infinite-loader** for virtual lists    
- **react-intersection-observer** for viewport detection    
- **use-debounce** for debouncing input/events    
- **@dnd-kit/core** & **@dnd-kit/sortable** for drag-and-drop    
- **clsx** and **tailwind-merge** for class management    
- **date-fns** for date handling    
- **lodash** for utility functions    
- **papaparse** for CSV parsing    
- **Google Maps API**    
    - `@googlemaps/react-wrapper`        
    - `@react-google-maps/api`        
    - `@types/google.maps`
---
### ✅ **Backend**
- **Supabase**    
    - PostgreSQL (DB)        
    - Supabase Auth        
    - Supabase Storage        
    - RLS policies        
    - Edge Functions _(for advanced logic)_
        
- **@supabase/supabase-js** client SDK    
- **ra-supabase** (data provider for `react-admin`)
---
### ✅ **Tooling & Dev Experience**
- **TypeScript** in strict mode    
- **eslint** + **prettier** + **lint-staged**    
- **vite-plugin-dts** for type declarations    
- **vite-plugin-eslint** _(optional but recommended)_    
- **rollup-plugin-visualizer** for bundle analysis    
- **vite-plugin-inspect** _(optional for module graph debugging)_
---
### ✅ **Testing**
- **vitest** for unit tests    
- **@testing-library/react**, `jest-dom`, `user-event` for component testing    
- **@playwright/test** for end-to-end testing    
- **@axe-core/playwright** for accessibility testing