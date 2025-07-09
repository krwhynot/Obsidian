Rewrite the project’s **API Specifications and Endpoints** into clean, Claude Code AI–optimized documentation.

The output should be in **Markdown format**, broken into **multiple modular files** (e.g. `auth_api.md`, `user_api.md`, `errors.md`) **if needed to stay within 2,000–4,000 token segments**, ideal for Claude's context window and parsing efficiency.

🔧 Claude Parsing & Formatting Best Practices:
- Use **clear and consistent section headers** (`##`, `###`)    
- Limit each section to **under 400 tokens (~300–500 words)**    
- Use **bullet points, bolded text, and code blocks** for clarity    
- Prefer **short summaries** before technical blocks    
- Avoid raw HTML, embedded images, or overly long inline code    

🔍 Each endpoint definition must include:
- **Endpoint**: HTTP method + route    
- **Purpose**: Brief explanation    
- **Request Parameters**: In **TypeScript interface** format    
- **Response Format**: In **TypeScript interface** format    
- **Example Usage**: Show `curl`, `fetch`, or `axios` request    
- **Example Response**: Realistic JSON structure    
- **Error Handling**: List common errors and how to handle them    

📦 Deliver the output in **clean Markdown**, logically segmented and ready for Claude Code AI to parse effectively.