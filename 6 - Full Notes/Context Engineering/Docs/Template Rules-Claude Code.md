Rewrite this  Authentication_and_Security_Implementation.md file that thoroughly documents the project’s authentication and security mechanisms, optimized for Claude Code AI parsing and comprehension.

If the file exceeds 2,000–4,000 tokens, break it down into modular Markdown files (e.g. auth_strategies.md, jwt_flow.md, encryption.md, rate_limiting.md, etc.) to maintain optimal Claude compatibility.

🧠 Claude-Friendly Formatting Rules:
Use ## and ### headers to organize concepts clearly
Keep individual sections under 400 tokens for focused context chunks
Use bullet points, bolded key terms, and well-indented code blocks
Start complex sections with a brief 1–2 sentence summary
Avoid inline images, raw HTML, or excessive nesting

🔐 Documentation should cover:
Authentication Methods (e.g. JWT, OAuth2, magic links, SSO)
Authorization Patterns (role-based, attribute-based, scopes)
Session Management (expiration, refresh tokens, revocation)
Encryption Techniques (password hashing, data at rest/in transit)
Secure Storage (key management, secrets handling)
Error Handling & Security Headers
Rate Limiting & Brute Force Protection
Environment Configuration (staging vs. prod security differences)
Best Practices (e.g. rotating secrets, auditing access logs)

📄 Each relevant part should include:
Clear TypeScript examples (e.g. token validation middleware)
Practical code snippets or configs (e.g. helmet, cors, bcrypt)
Error patterns (e.g. 401, 403 responses) and how to handle them
Short integration examples where relevant (login flow, token exchange)
Deliver clean Markdown output optimized for Claude Code AI to parse efficiently and maintain context over multi-part implementations.