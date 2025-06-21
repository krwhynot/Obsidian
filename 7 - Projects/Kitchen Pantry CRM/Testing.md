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