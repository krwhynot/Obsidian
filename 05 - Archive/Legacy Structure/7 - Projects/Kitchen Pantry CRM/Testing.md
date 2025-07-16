## Testing Phases and When to Apply Them

|Testing Type|When to Apply (Task Examples)|
|---|---|
|**Smoke/Sanity Testing**|After initial setup (e.g., Laravel/Filament install) to confirm environment and basic app runs (Task 21)|
|**Unit Testing**|As you develop individual models, utilities, or backend logic (e.g., Eloquent models, validation logic, Task 23)|
|**Integration Testing**|After connecting multiple modules or APIs (e.g., CRUD endpoints, model relationships, Task 23, 26, 27)|
|**End-to-End (E2E) Testing**|After major user flows are implemented (e.g., organization/contact/opportunity management, Task 26–29)|
|**User Acceptance Testing**|Before going live, after all major features are built and tested (Tasks 28–32, 35)|
|**Performance Testing**|After building core features and before/after optimization tasks (Tasks 32, 40)|
|**Security Testing**|After implementing authentication, RBAC, and before production deployment (Tasks 24, 38)|
|**Regression Testing**|After each major feature or bug fix, especially before releases (Ongoing, after any change)|

---
## Concrete Examples from Your Task List

- **Task 21 (Initialize Project):**    
    - Run smoke tests to verify Laravel and Filament are correctly installed and the app boots up.     
- **Task 22–23 (Schema & Models):**    
    - Write and run unit tests for each Eloquent model, accessor, mutator, and scope as you build them.        
    - After setting up relationships, run integration tests to verify data flows between models.        
- **Task 24 (Authentication & RBAC):**    
    - Unit test authentication logic.
    - Integration test login, registration, and role-based access.        
    - Security testing after all auth features are complete.        
- **Task 26–29 (CRUD Modules):**    
    - Integration and E2E tests as you connect backend APIs to frontend components.        
    - User acceptance tests after the full user flow is implemented (e.g., managing organizations, contacts, opportunities).        
- **Task 30 (Dashboard):**    
    - E2E tests for dashboard interactions and widget rendering.        
    - Performance testing for dashboard load times.        
- **Task 32 (Reporting):**    
    - Integration and performance testing for report generation, export, and delivery.        
- **Task 38 (Azure Deployment):**    
    - Smoke and regression testing after deployment to ensure the app works in production.        
    - Security and performance testing in the production environment.       

---

## General Guidelines

- **Test Early and Often:**  
    Don’t wait until the end; run unit and integration tests as you build each feature.    
- **Automate Where Possible:**  
    Set up CI to run tests on every commit, especially for unit/integration tests.    
- **Before Major Milestones:**  
    Run regression and acceptance tests before merging large features or deploying.    
- **After Each Dependency Is Met:**  
    For each module, as soon as its dependencies are complete, begin the relevant testing phase.
    
---

## Example Timeline

1. **After Task 21:** Smoke/sanity tests.    
2. **During Tasks 22–23:** Unit and integration tests for models and relationships.    
3. **During/after Task 24:** Auth unit/integration/security tests.    
4. **After each CRUD module (26–29):** Integration/E2E and acceptance tests.    
5. **After dashboard/reports (30, 32):** E2E, performance, and regression tests.    
6. **Before/after deployment (38):** Smoke, security, and performance tests.
7. 
## Additional Testing Types & When to Apply Them

|Testing Type|When to Apply (Relevant Tasks/Modules)|
|---|---|
|**Accessibility Testing**|After implementing major UI components (Dashboard widgets, Quick Add Menu, Organization/Contact Management, Profile/Settings pages).|
|**Usability Testing**|After UI/UX-heavy modules (Interaction Tracking, Quick Add Menu, Dashboard, Data Import/Export, Email/Calendar Integration).|
|**Data Integrity Testing**|After completing data migration (Excel import, Data Migration from Excel), and after implementing CRUD for core entities.|
|**Backup/Restore Testing**|After backup strategies are implemented (Azure App Service Deployment, Database/Settings modules).|
|**Upgrade/Migration Testing**|Before/after schema changes, or when updating Laravel/Filament or switching DBs (Database Schema, Migrations, Azure Deployment).|
|**Localization/Internationalization Testing**|After implementing language selection and multi-language support (User Profile/Settings, Notification Preferences).|
|**API Contract Testing**|After building or updating APIs (Organization, Contact, Interaction, Opportunity, Reporting, Import/Export, Search modules).|
|**Audit/Logging Verification**|After implementing audit logs (Settings, Import/Export, Security modules).|
|**Failover/Disaster Recovery Testing**|After backup, restore, and deployment automation are in place (Azure, DB, File Storage).|
|**Concurrency Testing**|After implementing batch processing, report generation, or high-traffic modules (Import/Export, Reporting, Search, Performance Opt).|

---

## Where to Insert These in Your Workflow

**Accessibility & Usability Testing**
- After each major UI module is functional but before final QA (Tasks 26–30, 35, 36).    
- Especially after implementing forms, dashboards, and quick entry features.
**Data Integrity Testing**
- After data migration from Excel (Task 39), before go-live.    
- After CRUD for core modules (Tasks 26–29, 31).
- **Backup/Restore & Disaster Recovery**
- After backup strategies are implemented (Task 38, Azure App Service Deployment).    
- Test restoring from backup before production launch and after significant data changes.
**Upgrade/Migration Testing**
- Any time you change database schema (Tasks 22, 39) or upgrade major dependencies (Laravel, Filament).
**Localization/Internationalization**
- After implementing language selection and user preferences (Task 36).
**API Contract Testing**
- After building or modifying any public/internal API (Tasks 26–34).
**Audit/Logging Verification**
- After audit logging is added to settings, import/export, or security modules (Tasks 25, 34, 40).
**Failover/Disaster Recovery**
- After deployment automation and backup are in place (Task 38).
**Concurrency Testing**
- After implementing batch processing, reporting, or modules expected to handle high load (Tasks 32, 34, 40).

---

## Example Timeline
1. **After each UI module:** Accessibility & Usability Testing    
2. **After data migration/import:** Data Integrity & Backup/Restore Testing    
3. **After API changes:** API Contract Testing    
4. **After implementing language support:** Localization Testing    
5. **After audit logging:** Audit/Logging Verification    
6. **After backup/disaster recovery setup:** Failover Testing    
7. **After batch/reporting implementation:** Concurrency Testing
---

## Why These Tests Matter

- **Accessibility & Usability:** Ensures all users, including those with disabilities, can use your app efficiently.    
- **Data Integrity:** Prevents data loss/corruption during migrations and CRUD operations.    
- **Backup/Restore:** Confirms you can recover from failures or mistakes.    
- **Upgrade/Migration:** Prevents regressions when changing schemas or dependencies.    
- **Localization:** Ensures correct display and function for all supported languages.    
- **API Contract:** Prevents frontend/backend integration bugs.    
- **Audit/Logging:** Confirms traceability for compliance and debugging.    
- **Failover/Disaster Recovery:** Ensures business continuity.    
- **Concurrency:** Prevents race conditions and performance bottlenecks under load.