### ForkFlow-CRM: Technical Overview

**Project Purpose:**  
ForkFlow-CRM is a web-first, mobile-friendly CRM designed for food brokers who visit restaurants and stores. It focuses on customer management, visit tracking (with GPS), follow-up reminders, and map integration.

---

#### 1. **Frontend**

- **Framework:** React (with TypeScript)
  - Modern, component-based UI with strong type safety.
- **UI Libraries:**  
  - **react-admin:** For admin-style CRUD interfaces and resource management.
  -  **Tremor**
  - **Tailwind CSS:** Utility-first CSS for rapid, responsive, and mobile-first design.
- **Maps:**  
  - **Google Maps JavaScript API:** For displaying and interacting with customer locations.
- **Best Practices:**  
  - Mobile-first design (44px+ touch targets).
  - Modern React patterns (function components, hooks, context).
  - TypeScript strict mode for type safety.

---

#### 2. **Backend**

- **Platform:** Supabase
  - **Database:** PostgreSQL (hosted, managed by Supabase).
  - **Auth:** Supabase Auth for user authentication and authorization.
  - **Storage:** Supabase Storage for file uploads (e.g., attachments, avatars).
  - **API:** Supabase auto-generates RESTful endpoints and provides a JS client.
- **Security:**  
  - Row Level Security (RLS) policies for fine-grained access control.
  - JWT-based authentication.

---

#### 3. **Architecture & Patterns**

- **Cloud-Only:** No Docker or local DB required; everything runs in the cloud.
- **Separation of Concerns:**  
  - Clear separation between UI, data fetching, and business logic.
  - Custom hooks for data and state management.
- **Testing:**  
  - Unit and integration tests for critical paths.
- **Dev Experience:**  
  - TypeScript for all code.
  - Linting, formatting, and strict code quality rules.

---

#### 4. **Key Features**

- Customer, contact, and organization management.
- Visit tracking with GPS and map visualization.
- Follow-up reminders and activity logging.
- Mobile-optimized interface.
- Extensible with modern React and Supabase patterns.

---

#### 5. **Why This Stack?**

- **React + TypeScript:** Modern, maintainable, and scalable frontend.
- **Supabase:** Serverless, scalable backend with minimal ops overhead.
- **Tailwind CSS:** Fast, consistent, and responsive UI development.
- **react-admin:** Rapid CRUD and admin interface development.
- **Cloud-first:** Easy onboarding, no local setup headaches.

---

**In summary:**  
ForkFlow-CRM is a modern, cloud-native CRM built with React, TypeScript, Tailwind CSS, and Supabase, following best practices for security, scalability, and developer experience. It’s designed for rapid iteration, mobile usability, and easy extensibility.
