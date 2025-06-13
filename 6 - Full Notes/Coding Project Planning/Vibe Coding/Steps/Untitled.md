## Vibe‑Coding Framework

We’ll break any project into **four phases**, each with **guided AI prompts** and **managerial checks**.

|Phase|Goal|Manager Prompts & Checks|
|---|---|---|
|**1. Define & Scope**|Nail down “vibe” concept & MVP feature|• “AI, list 5 distinct vibe concepts…”  <br>• Check: scope is ≤ 3 screens/features?|
|**2. Design & Blueprint**|Wireframes + data contract|• “Generate JSON schema for feature X.”  <br>• Check: Align UX flows with schema?|
|**3. Build & Iterate**|Code components + AI‑powered logic|• “Write React component for InputForm.”  <br>• Check: Code compiles, unit tests pass?|
|**4. Polish & Deploy**|Styling, performance, deployment|• “Optimize Tailwind classes for performance.”  <br>• Check: Lighthouse score ≥ 90?|

---

### Phase 1: Define & Scope

1. **Ideation prompt to AI**
    
    - “Suggest 5 ‘vibe‑app’ ideas in our domain (e.g. music, art, wellness), each with 1‑sentence description and 3 key features.”
        
2. **Select your MVP**
    
    - Pick the concept whose scope fits a 2‑week sprint (≤ 3 core features).
        
3. **Write high‑level user stories**
    
    - E.g. “As a user, I want to type a mood and see a matching color scheme so I feel immersed in that vibe.”
        
4. **Define success metrics**
    
    - E.g. “Response time < 2 s,” “User can share palette via link.”
        

> **Checkpoint:** Do your user stories cover who, what, why? Are metrics realistic?

---

### Phase 2: Design & Blueprint

1. **Wireframes & flowchart**
    
    - Sketch (paper or Figma) each screen: inputs → AI call → output.
        
2. **Data contract / API spec**
    
    - Ask AI: “Given feature X, produce a JSON schema with example payloads.”
        
3. **Tech‑stack decision**
    
    - Choose frontend (React, Vue, Svelte), styling (Tailwind), backend/AI integration (Node.js, serverless).
        
4. **Task breakdown**
    
    - Break each feature into 2–5 dev tasks (e.g. “Create InputForm component,” “Implement fetch hook,” “Style output card”).
        

> **Checkpoint:** Can you map each wireframe to 2–3 tasks and its JSON schema?

---

### Phase 3: Build & Iterate

1. **Sprint planning**
    
    - Group tasks into 3–5 day sprints.
        
    - Assign AI “tickets”: e.g.
        
        > “AI, generate code for `InputForm.tsx` with props for `onSubmit(mood: string)`.”
        
2. **Review & test**
    
    - After AI writes code, you review:
        
        - Does it follow best practices?
            
        - Add or refine unit tests.
            
3. **Daily stand‑up with AI**
    
    - Prompt: “Yesterday I completed X; today I’ll do Y; blockers: Z.”
        
    - AI suggests solutions for Z.
        

> **Checkpoint:** Is each component tested and peer–reviewed (by you)?

---

### Phase 4: Polish & Deploy

1. **Styling pass**
    
    - “AI, refactor Tailwind classes to remove duplicates and minimize bundle size.”
        
2. **Performance audit**
    
    - Lighthouse / Web Vitals.
        
    - AI prompt: “How can I reduce Largest Contentful Paint?”
        
3. **Deployment script**
    
    - Write CI/CD pipeline file (GitHub Actions / Azure DevOps).
        
4. **Post‑launch monitoring**
    
    - Setup error logging (Sentry) + analytics.
        

> **Checkpoint:** Are performance goals met? Are errors & metrics flowing?

---

## 3. Practical Tips & Prompts

- **Always start with “Hey AI, act as my React/UX/DevOps expert…”**
    
- **Keep prompts granular:** one task, one outcome.
    
- **Iterate fast:** stop after “good enough,” then refine.
    
- **Document decisions:** in your repo’s README or Notion.
    

---

## 4. Your Next Steps

1. **Pick a simple vibe idea** (e.g. “rainy‑day color selector”).
    
2. Draft 3 user stories + success metrics.
    
3. Sketch a wireframe on paper.
    
4. Use the Phase 1 prompts to ask AI for idea variations.
    

Feel free to pause after each **Checkpoint**—ask questions or adjust before moving on. Let me know when you’re ready for more depth in any phase!