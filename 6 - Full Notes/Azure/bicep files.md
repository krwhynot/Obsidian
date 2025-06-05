



### **What Happens if There's an Error?**

- **During Deployment:** If a resource fails to deploy (e.g., invalid property, quota limits), **Azure stops the deployment** and **rolls back** the changes by default in a **single-resource group scope**. No partial resource states are left, unless you explicitly disable the rollback.
    
- **Runtime or Logical Errors:** These (e.g., bad app settings, missing CORS) won't stop deployment, but your app may not run correctly. This is why environment testing is essential.
    
- **Best Practice:** Pair Bicep with CI/CD pipelines to test `validate`, `what-if`, and `deploy` steps automatically with proper gating.