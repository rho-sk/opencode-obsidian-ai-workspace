---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/obsidian
---
# OpenCode Obsidian AI Workspace – Workflow

Daily workflow and usage scenarios.

**Related docs:**
- [[03-vault-structure]] – Previous step
- [[00-introduction]] – Project introduction

---

## How the agent works automatically

The OpenCode Chat plugin has a configuration parameter **`rules-path`** that points to the `system/` folder. **All files** in this folder are automatically loaded at the start of every session – you don't need to send anything manually.

Along with the rules, the plugin also loads **`system/opencode-chat-settings.md`** – a file the plugin automatically generates and updates whenever settings change. It contains current values such as the projects folder.

From the very first message the agent knows:
- where to store notes (reads current values from `opencode-chat-settings.md`)
- which tags to use
- which templates exist
- how to format frontmatter

Just start writing.

---

## Usage scenarios

### Scenario 1: Creating a new project

**Prompt:**
```
Create a new project note for project "my-api"
Project goal: Build a REST API for user management
Tech stack: Node.js, PostgreSQL
```

**Agent will:**
1. Load `templates/project.md`
2. Create the file in the configured projects folder (e.g. `projects/my-api/overview.md`)
3. Fill frontmatter, tags (`type/project`, `status/active`, `project/my-api`)
4. Fill template sections with your information

---

### Scenario 2: Recording a decision (ADR)

**Prompt:**
```
Record an architecture decision: We chose PostgreSQL over MongoDB for the my-api project.
Reason: ACID compliance needed, structured data, team expertise.
```

**Agent will:**
1. Load `templates/decision.md`
2. Create the file in the configured projects folder (e.g. `projects/my-api/decision-postgresql.md`)
3. Fill in context, reasons, consequences

---

### Scenario 3: Creating a task

**Prompt:**
```
Create a task: Implement user authentication endpoint for my-api project.
Priority: high
```

**Agent will:**
1. Load `templates/task.md`
2. Create the file in the configured projects folder (e.g. `projects/my-api/task-implement-auth-endpoint.md`)
3. Set `type/task`, `status/active`, `priority/high`, `project/my-api`

---

### Scenario 4: Free-form note / brainstorming

**Prompt:**
```
Create a note with my thoughts on caching strategies.
Key ideas: Redis for sessions, CDN for static assets, database query caching.
```

**Agent will:**
1. Load `templates/note.md`
2. Create `notes/caching-strategies.md`
3. Capture ideas in a structured way

> **Note:** Free-form notes can be saved to the root or a `notes/` folder – they are not tied to the projects folder.

---

### Scenario 5: Searching and reviewing

**Prompt:**
```
List all active tasks for the my-api project
```

or

```
What decisions have been made for the my-api project?
```

The agent searches the vault by tags and wikilinks and returns an overview.

---

### Scenario 6: Updating task status

**Prompt:**
```
Mark task-implement-auth-endpoint in my-api as done
```

**Agent will:**
1. Find the file
2. Update `status/active` → `status/done`
3. Add `updated:` to frontmatter

---

### Scenario 7: Recording an AI conversation

After an important AI session, request a record:

**Prompt:**
```
Save this conversation as a conversation note.
Topic: Architecture decisions for my-api
```

**Agent will:**
1. Load `templates/conversation.md`
2. Create `conversations/[date]-architecture-my-api.md`
3. Summarize key points from the conversation

---

## Tips for effective workflow

### Language

- Communicate with the agent in any language – it responds in the same language
- Template sections are in English (Overview, Goals...) – write content in English, Slovak, or any language

### Tag consistency

When creating a new note, name the type and project explicitly:

```
Create a task note for project "my-api" with priority high
```

Without context the agent may use incorrect tags or folder.

### Archiving

When a project is complete:

```
Archive the my-api project. Move it to archive/ and update status to archived.
```

### Iterating on templates

Templates are not final – customize them:

```
Add a "Risk" section to templates/project.md
```

The change applies to all future project notes.

---

## Recommended daily workflow

**Morning:**
```
What active tasks do I have?
```

**During work:**
- Create notes on the go ("create a task for...", "record a decision about...")
- No need to remember the structure – the agent knows it from the rules loaded automatically at startup

**Evening / end of day:**
```
Update status of completed tasks from today
```

---

**Congratulations** – your OpenCode Obsidian AI Workspace is set up. You can now work with the AI agent directly inside your vault.
