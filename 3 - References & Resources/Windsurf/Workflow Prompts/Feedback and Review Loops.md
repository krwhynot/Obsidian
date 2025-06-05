# Workflow: Feedback and Review Loops

<!--
This workflow enforces structured code review cycles using AI and human feedback.
It is copy-ready and compliant with your `.windsurf/workflows/` requirements.
-->

## Description

Create quality gates using multi-agent or self-reflective review cycles. This ensures the AI-generated code is critiqued before integration.

---

## Steps

1. **Collect Code for Review**
   - Take generated code from the current implementation step.
   - Save in a temporary `.tmp` or staging file.

2. **Choose Review Strategy**
   - Decide:
     - `self-review`: AI critiques its own code.
     - `multi-agent`: Use another AI to provide external feedback.

3. **Identify Issues**
   - Request detection of:
     - Code smells
     - Inefficient logic
     - Violated standards from planning phase

4. **Refactor Code**
   - Apply AI-suggested improvements.
   - Request explanation for every major change.

5. **Manual Review**
   - Perform human review.
   - Decide to accept, revise, or reject proposed code.

6. **Summarize Decisions**
   - Store review outcomes in `Chatlog.md` or `review-log.md`.

---

## Notes

<!--
- Helps catch errors early and improve AI quality.
- Encourages collaboration between agents and developers.
- This file is copy-ready and compliant with your `.windsurf/workflows/` directory format.
-->
