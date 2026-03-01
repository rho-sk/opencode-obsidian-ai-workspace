---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/obsidian
---
# OpenCode Obsidian AI Workspace – Vault Structure

This document describes the vault organization system and how to install it.

**Related docs:**
- [[02-bedrock-setup]] – Previous step
- [[04-workflow]] – Next step

---

## Organization philosophy

**Simplicity first:**
- Minimal folder structure
- Semantic organization via **tags** (not folders)
- The AI agent "knows" how to work thanks to `system/opencode-rules.md` – rules are loaded automatically at every session start
- Every note type has a **template** → consistency without effort

**Language of system/ and templates/:** Files are in English – Claude responds in the language you write in (write in Slovak → get Slovak responses). Template sections (Overview, Goals...) are in English, but you write note content in any language.

---

## Folder structure

```
vault/
├── system/                ← rules and guides for the agent + you
│   ├── opencode-rules.md  ← main rules for the OpenCode agent
│   ├── quick-guide.md     ← quick reference for you
│   └── tag-index.md       ← all tags and their descriptions
├── templates/             ← templates for every note type
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── projects/              ← active projects (one folder = one project)
│   └── [project-name]/
├── archive/               ← archived notes and projects
└── conversations/         ← AI conversation records
```

---

## Tag system

Tags are the **primary organization method** – more important than folders.

### Required tags (every note must have at least one)

**Note type (`#type/`):**

| Tag | Use |
|---|---|
| `#type/project` | Project note, project overview |
| `#type/task` | Task, to-do item |
| `#type/note` | Free-form note, idea |
| `#type/reference` | Documentation, tutorial, guide |
| `#type/conversation` | AI conversation record |
| `#type/decision` | Decision record (ADR) |

**Status (`#status/`):**

| Tag | Use |
|---|---|
| `#status/draft` | Work in progress |
| `#status/active` | Actively being worked on |
| `#status/done` | Completed |
| `#status/archived` | Archived |

### Recommended tags

**Project:** `#project/[project-name]`

**Topic:** `#topic/ai`, `#topic/development`, `#topic/obsidian`, `#topic/infrastructure`, ...

**Priority (for tasks):** `#priority/high`, `#priority/medium`, `#priority/low`

---

## Frontmatter standard

Every note should have a YAML frontmatter:

```yaml
---
created: 2026-03-01
updated: 2026-03-01
tags:
  - type/project
  - status/active
  - project/my-project
  - topic/development
---
```

---

## Installing the vault structure

### Option A: GitHub Release (recommended)

Download the ZIP from GitHub releases:

```
https://github.com/[username]/opencode-obsidian-ai-workspace/releases
```

Extract to the vault root:

```bash
unzip opencode-obsidian-ai-workspace.vX.Y.Z.zip -d /PATH/TO/YOUR/VAULT/
```

The ZIP contains:
- `system/` → extracts to `vault/system/` (EN rules for the agent)
- `templates/` → extracts to `vault/templates/` (EN sections, write content in any language)
- `opencode-obsidian-ai-workspace.vX.Y.Z/` → manuals

### Option B: Clone from GitHub repo

```bash
git clone https://github.com/[username]/opencode-obsidian-ai-workspace.git /tmp/workspace-repo

cp -r /tmp/workspace-repo/system/* /PATH/TO/YOUR/VAULT/system/
cp -r /tmp/workspace-repo/templates/* /PATH/TO/YOUR/VAULT/templates/

rm -rf /tmp/workspace-repo
```

---

## Key files – overview

### `system/opencode-rules.md`

**The most important file.** Defines rules for the AI agent:
- Folder structure and where to store notes
- Tag hierarchy (required tags, recommended)
- Frontmatter standard
- How to use templates
- File naming (lowercase, hyphens)
- Workflow: creation, update, archiving

The file is in English – Claude understands it and responds in your language. Rules are loaded automatically at every session start via the plugin's `rules-path` configuration.

### `system/quick-guide.md`

A concise guide **for you** – how to search, create notes, workflow.

### `system/tag-index.md`

Complete list of all tags in your vault with descriptions. Add new tags here as you create them.

### `templates/`

Templates for every note type. Sections are in English (Overview, Goals, Description...) – you write the content in any language. The agent uses them automatically when creating new notes.

---

## Verifying the installation

After installation, verify in OpenCode Chat:

```
Summarize the note organization rules for this vault
```

The AI should summarize the rules from `system/opencode-rules.md` – loaded automatically.

Then test note creation:

```
Create a project note for project "test-workspace"
```

The AI should:
1. Load `templates/project.md`
2. Fill in the placeholders
3. Create `projects/test-workspace/overview.md`
4. Add correct tags and frontmatter

**✅ Checkpoint:** Vault structure works, agent uses rules and templates

---

## Customizing for your workflow

### Add your own rules

Edit `system/opencode-rules.md` – add a section:

```markdown
## Custom rules

### Note language
- Primary language: English

### Projects
- Each project has subdirectories: docs/, tasks/
- Archived projects: archive/YYYY/[project]/

### Tasks
- Deadline in frontmatter: `due: YYYY-MM-DD`
```

### Create a custom template

Copy an existing template and modify:

```
AI: Copy templates/note.md to templates/meeting.md and add sections: Attendees, Agenda, Action Items
```

---

**Next step:** [[04-workflow]] – Daily workflow and scenarios
