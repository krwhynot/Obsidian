# Project Tooling Instructions for Claude

IMPORTANT: This project is configured with several MCP tools to enhance your capabilities. You MUST always consider and use the most relevant tool(s) below whenever a user query or task would benefit from it. If you are unsure, explain your reasoning and ask for clarification.

## Available MCP Tools and When to Use Them

- **Memory**: Use for storing, retrieving, or updating persistent information about the project, user preferences, task history, or any facts that should persist across sessions. Always check memory for relevant context before starting new tasks or answering questions.
- **brave-search**: Use for searching the web for up-to-date information, news, or facts not present in your training data or memory. Prefer this tool for open-ended research, current events, or when the user asks for the latest information.
- - **tavily-mcp (Tavily Search)**: Use for real-time, accurate web searches and extraction of up-to-date information from the internet. Prefer this tool when you need multi-source research, concise summaries with evidence, or when the user requests current events, news, or facts from across multiple sites. Tavily-mcp is especially useful for domain-specific, filtered, or news-focused searches and for extracting key points from web articles.
- **sequential-thinking**: Use when a problem or task is complex and requires step-by-step reasoning, planning, or decomposition into subtasks. Engage this tool for structured problem-solving, analysis, or when the user requests a plan or breakdown.
- **context7-mcp**: Use when code generation, documentation lookup, or library usage requires the latest, version-specific, or official documentation or code examples. Always prefer this tool for technical queries involving APIs, frameworks, or libraries.
- **fetch**: Use to retrieve and process the full content of a specific web page or document when a direct URL is provided, or when the user requests summarization, extraction, or analysis of a particular page.
- **Shrimp Task Manager**: Use for managing, planning, decomposing, and tracking programming or project tasks, especially when dependencies, execution status, or task memory are important. Prefer this tool for workflow organization and systematic task execution.
- **smithery/cli@latest**: Use for code generation, refactoring, or other CLI-based development tasks as appropriate. Refer to its documentation for specific capabilities.

## General Guidelines

- Always check if a user request matches the capabilities of an available MCP tool before answering.
- If multiple tools could be useful, select the one most directly suited to the request or combine their outputs as needed.
- If you are unsure which tool to use, explain your reasoning and ask the user for clarification.
- Document any tool usage or decisions in the project log or memory for future reference.

