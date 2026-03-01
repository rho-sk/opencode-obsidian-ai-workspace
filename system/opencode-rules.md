---
created: '2026-03-01'
tags:
  - type/reference
  - topic/obsidian
  - topic/organization
type: documentation
---
# Rules for the OpenCode Agent

> These rules are in English so they work regardless of the language you use when chatting with the agent. The agent will always respond in the language you write in.

## Note Organization in the Obsidian Vault

This document defines the rules that the **OpenCode agent MUST follow** when working with notes in this Obsidian vault.

---

## 1. Folder Structure

Notes are organized into a minimal folder structure:

```
/
├── projects/              # Active projects (one folder = one project)
│   ├── [project-name]/
│   └── ...
├── archive/               # Archived projects and notes
├── conversations/         # AI conversations
├── templates/             # Templates for different note types
└── system/                # System files, configuration
```

### Rules:
- **Every new project** goes in `projects/[project-name]/`
- **Project notes** are saved inside the project folder
- **AI conversations** are saved in `conversations/`
- **Documentation and references** can go in the project folder or the root
- **Old/inactive notes** are moved to `archive/`

---

## 2. Tag Hierarchy (SEMANTIC STRUCTURE)

Tags are the **primary organization method**. Every note MUST have relevant tags.

### 2.1 Required Tags

**Every note MUST have at least one `#type/` tag:**

- `#type/project` – project note (overview, project documentation)
- `#type/task` – task, something to do
- `#type/note` – free-form note, thought, record
- `#type/reference` – reference documentation, guide, tutorial
- `#type/conversation` – AI conversation
- `#type/decision` – decision, ADR (Architecture Decision Record)

**Notes with state MUST have a `#status/` tag:**

- `#status/draft` – work in progress
- `#status/active` – actively working on it
- `#status/done` – completed
- `#status/archived` – archived

### 2.2 Recommended Tags

**Projects:**
- `#project/[project-name]` – assignment to a project

**Topics/areas:**
- `#topic/ai`
- `#topic/infrastructure`
- `#topic/development`
- `#topic/obsidian`
- `#topic/integration`
- `#topic/[custom-topic]` – create your own topic as needed

**Priority (for tasks):**
- `#priority/high`
- `#priority/medium`
- `#priority/low`

### 2.3 Tag Rules

- Write tags **at the end of the document** (below a `---` separator)
- Use **consistent naming**: lowercase, hyphens instead of spaces
- When creating a new tag **check if a similar one already exists** (use vault search)
- **Don't spam tags** – max 5–7 tags per note

---

## 3. Frontmatter (YAML Header)

Every note should have YAML frontmatter with metadata.

### Minimal frontmatter:

```yaml
---
created: YYYY-MM-DD
tags:
  - type/[type]
  - status/[status]
  - project/[project]
---
```

### Extended frontmatter (optional):

```yaml
---
created: YYYY-MM-DD
updated: YYYY-MM-DD
tags:
  - type/[type]
  - status/[status]
  - project/[project]
author: [name]
related:
  - "[[Related Note 1]]"
  - "[[Related Note 2]]"
---
```

---

## 4. Templates

When creating new notes **ALWAYS use the appropriate template** from `templates/`:

- `templates/project.md` – for new projects
- `templates/task.md` – for tasks
- `templates/note.md` – for free-form notes
- `templates/decision.md` – for decisions
- `templates/conversation.md` – for AI conversations
- `templates/reference.md` – for references

### How to use a template:

1. Load the template content
2. Replace placeholders:
   - `{{title}}` → note title
   - `{{date}}` → today's date (YYYY-MM-DD)
   - `{{project-name}}` → project name
   - `{{topic}}` → topic
3. Fill in the relevant sections
4. Save the note

---

## 5. Note Linking

Use **wikilinks** to connect related notes:

```markdown
[[Note Title]]
[[Note Title|Alias]]
```

### Linking rules:

- In every note **link to related notes** (section "Related notes")
- In decisions link to **context and impact**
- In tasks link to **the project and related tasks**
- Project notes should link to **all key related documents**

---

## 6. File Naming

### Name format:

```
[descriptive-name].md
```

### Rules:

- Lowercase letters
- Hyphens instead of spaces
- Short but descriptive name
- **DO NOT add a date to the filename** (that goes in frontmatter)
- Exception: conversations may include a date if useful

### Examples:

Good:
- `projects/bedrock/obsidian-opencode-integration.md`
- `projects/bedrock/aws-credentials-setup.md`
- `conversations/ai-chat-2026-02-28.md`

Bad:
- `Obsidian OpenCode Integration.md` (spaces)
- `PROJECT BEDROCK.md` (uppercase)
- `note1.md` (not descriptive)

---

## 7. Workflow for the OpenCode Agent

### 7.1 When creating a new note:

1. **Determine the note type** (project/task/note/decision/...)
2. **Load the appropriate template** from `templates/`
3. **Replace placeholders** with current values
4. **Fill in the frontmatter** with `created`, `tags`
5. **Add relevant tags** at the end (below `---`)
6. **Save to the correct folder**

### 7.2 When updating a note:

1. **Preserve existing tags** (do not overwrite)
2. **Update the `updated` field** in frontmatter
3. **Add new tags** if relevant
4. **Update status** if it changed (`#status/...`)

### 7.3 When searching for notes:

Use **Obsidian search** with tags:

```
tag:#type/project tag:#status/active
tag:#project/bedrock
tag:#topic/ai
```

### 7.4 When archiving:

1. Change tag `#status/active` → `#status/archived`
2. Move the file to `archive/`
3. Update the `updated` field

---

## 8. Examples

### Example: New project note

**User input:**
> "Create a note for the Obsidian + Amazon Bedrock integration project"

**Agent action:**

1. Load template `templates/project.md`
2. Fill in:
   - `{{title}}` = "Obsidian + Amazon Bedrock Integration"
   - `{{date}}` = "2026-03-01"
   - `{{project-name}}` = "bedrock"
3. Save to `projects/bedrock/obsidian-bedrock-integration.md`
4. Add tags:
   ```
   #type/project #status/active #project/bedrock #topic/ai #topic/obsidian
   ```

### Example: New task

**Input:**
> "Need to configure CORS for the OpenCode server"

**Action:**

1. Template `templates/task.md`
2. Save to `projects/opencode/configure-cors.md`
3. Tags: `#type/task #status/active #project/opencode #priority/high`

---

## 9. Project Naming Rules

When creating a new project:

- **Folder name:** lowercase, hyphens (`projects/my-project/`)
- **Project tag:** `#project/my-project`
- **Main project file:** `projects/my-project/README.md` or `projects/my-project/overview.md`

---

## 10. Migrating Existing Notes

If you find notes outside this structure:

1. **Do not migrate automatically** – inform the user
2. If the user agrees:
   - Add frontmatter if missing
   - Add relevant tags
   - Move to the correct folder
3. Preserve backlinks (other notes may link to it)

---

## Summary for the OpenCode Agent

**When working with notes in this vault:**

Do:
- Use templates from `templates/`
- Add tags (minimum `#type/` and `#status/`)
- Create frontmatter with `created`, `tags`
- Save to the correct folder
- Link related notes
- Use consistent naming

Don't:
- Create notes without tags
- Use spaces in filenames
- Forget frontmatter
- Overwrite existing tags

---

**Note:** These rules are a living document. Update this file when the vault organization changes.
