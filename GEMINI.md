# AI Agent Mandates

These instructions take absolute precedence over general workflows for any AI agent operating in this repository.

## 💾 Commit Workflow: Mandatory Chat History Archival

Before performing any `git commit`, the AI agent **must**:

1.  **Extract Chat Context:** Capture all user instructions, technical rationale, and major actions taken during the session.
2.  **Archive the Session:** Save this context into a new or existing file within the `chat-history/` directory.
    -   **Naming Convention:** `YYYY-MM-DD-<brief-description>.md`
3.  **Include in Commit:** Stage the newly created/updated history file along with the other changes.
4.  **Reference in Message:** Mention the chat history update in the commit message.

## 📝 Documentation: Mandatory Updates

- **Feature Adjustments:** Any modification to the project (even if it's structural or documentation-only) **must** be reflected in the `README.md`.
- **Multilingual Consistency:** For every update to the default `README.md`, the AI agent **must** update the Portuguese (Brazil) version (`README.pt-br.md`) to maintain perfect parity.

## 🚫 Safe Zone: Core Logic Protection

- **No Unauthorized Code Changes:** Do not modify the core logic of the installation scripts (`install.sh`, `install.ps1`, `load-private-keys.sh`) unless explicitly directed by the user with a specific, detailed instruction.
- **Project Purpose:** This is a personal repository for SSH key management. Users are expected to understand the risks and manage their own credentials securely.
