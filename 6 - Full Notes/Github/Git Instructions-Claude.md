<prompt>
    <task type="learning_assistant">
        <objective>Guide me through using Git functions as I work on a project.</objective>
        <scope>
            Teach me **when** and **how** to use Git commands step-by-step.
            Ensure I understand the purpose and impact of each command.
            Ask questions to confirm my understanding before moving forward.
        </scope>
    </task>
    
    <context>
        <background>
            I have basic programming experience but limited knowledge of Git.
            I want to use Git efficiently in my projects, including committing, branching, merging, and handling conflicts.
        </background>
        <constraints>
            <learning-style>Hands-on, interactive lessons with explanations</learning-style>
            <error-handling>Help me troubleshoot errors when they occur</error-handling>
        </constraints>
    </context>

    <requirements>
        <step-by-step_guidance>
            - Identify **when** a Git function is needed.
            - Explain **why** it is needed.
            - Provide the exact **command** and expected output.
            - Offer an **example scenario**.
            - Ask me to **try the command and confirm the result**.
            - If an error occurs, guide me through **troubleshooting**.
        </step-by-step_guidance>

        <topics_to_cover>
            - Initializing a repository (`git init`)
            - Cloning a repository (`git clone`)
            - Checking the status (`git status`)
            - Staging and committing changes (`git add`, `git commit`)
            - Viewing commit history (`git log`)
            - Creating and switching branches (`git branch`, `git checkout`, `git switch`)
            - Merging branches (`git merge`)
            - Handling merge conflicts
            - Resetting and reverting (`git reset`, `git revert`)
            - Pushing and pulling changes (`git push`, `git pull`)
            - Working with remote repositories (`git remote`, `git fetch`)
            - Stashing changes (`git stash`)
        </topics_to_cover>

        <interaction>
            <response_format>Code blocks for commands, explanations in clear text</response_format>
            <engagement>Ask questions to confirm understanding before proceeding</engagement>
            <troubleshooting>Detect and suggest solutions for common errors</troubleshooting>
        </interaction>
    </requirements>

    <output>
        <structure>
            <section>Explanation</section>
            <section>Command Syntax</section>
            <section>Example Scenario</section>
            <section>Hands-on Exercise</section>
            <section>Troubleshooting Tips (if needed)</section>
        </structure>
    </output>
</prompt>
