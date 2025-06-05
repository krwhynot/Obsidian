
<%*
const projectName = await tp.system.prompt("Enter Project Name");
const basePath = `7 - P
<%*
const projectName = await tp.system.prompt("Enter Project Name");
const basePath = `7 - Projects/${projectName}`;
<%*
const projectName = await tp.system.prompt("Enter Project Name");
const basePath = `7 - Projects/${projectName}`;

const folders = [
  basePath,
  `${basePath}/🧠 Concepts`,
  `${basePath}/🧪 Experiments`,
  `${basePath}/🐛 Bugs`,
  `${basePath}/📒 Meeting Notes`
];
TAGS: 

# Project Setup - Project Planning

## 1. Project Overview
- **Project Name**: Project Setup
- **Date**: 2025-06-04
- **Description**: Briefly describe what the project is about and its primary goals.

## 2. Problem Statement
- What problem does this project aim to solve?
- Why is it important to solve this problem?

## 3. Objectives
- List the main objectives of this project.
  - Objective 1
  - Objective 2
  - Objective 3

## 4. Requirements
- **Functional Requirements**: List the key functionalities or features the project must have.
  - Requirement 1
  - Requirement 2
  - Requirement 3
- **Non-Functional Requirements**: List any non-functional aspects, like performance, security, or scalability.
  - Requirement 1
  - Requirement 2

## 5. Stakeholders
- Who are the stakeholders or users of this project? 
  - Stakeholder 1
  - Stakeholder 2

## 6. Tools and Technologies
- **Languages/Frameworks**: List the programming languages, frameworks, or libraries needed.
  - Language/Framework 1
  - Language/Framework 2
- **Tools**: List any tools required for development, testing, and deployment.
  - Tool 1
  - Tool 2

## 7. Project Structure
- Outline the structure of the project (e.g., file organization, architecture).
  - Component 1
  - Component 2

## 8. Milestones
- Define major milestones and their estimated timelines.
  - Milestone 1: Description - Due Date
  - Milestone 2: Description - Due Date

## 9. Implementation Plan
- **Step-by-Step Plan**:
  1. Step 1
  2. Step 2
  3. Step 3

## 10. Challenges and Risks
- List potential challenges and risks, along with mitigation strategies.
  - Challenge 1: Mitigation Strategy
  - Challenge 2: Mitigation Strategy

## 11. Research and References
- List any research or reference materials needed to complete the project.
  - Reference 1
  - Reference 2

## 12. Notes and Ideas
- Additional notes or ideas related to the project.

## 13. Next Steps
- List the immediate next steps to take in moving forward with this project.

---

**Remember to update this page as the project progresses.**



for (const folder of folders) {
  try {
    await app.vault.createFolder(folder);
  } catch (err) {
    console.log(`Folder exists: ${folder}`);
  }
}

// 🎯 Current Focus.md
const focusContent = `---
last-updated: ${tp.date.now("YYYY-MM-DD HH:mm")}
project: ${projectName}
---

# 🎯 Current Focus: 

## Today’s Goal
- [ ] 

## Last Edited File
[[${basePath}/🧠 Concepts/]]

## Context
Line: 
Status: [In Progress | Blocked | Done]

## Next Step
- [ ] 
`;
await app.vault.create(`${basePath}/🎯 Current Focus.md`, focusContent);

// Other base notes
await app.vault.create(`${basePath}/🗓️ Timeline.md`, `# 🗓️ Timeline for ${projectName}`);
await app.vault.create(`${basePath}/🧭 Roadmap.md`, `# 🧭 Roadmap for ${projectName}`);
await app.vault.create(`${basePath}/📦 Patterns Used.md`, `# 📦 Patterns Used in ${projectName}`);
%>
