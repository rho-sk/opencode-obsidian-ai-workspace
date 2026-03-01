---
created: '2026-03-01'
tags:
  - type/reference
  - topic/obsidian
  - topic/organization
type: index
---
# Tag Index

Complete list of all tags used in this vault and their meaning.

---

## Note types (`#type/`)

| Tag | Meaning | Usage |
|-----|---------|-------|
| `#type/project` | Project note | Project overview, documentation, goals |
| `#type/task` | Task | Something to do, action items |
| `#type/note` | Free-form note | Thoughts, records, brainstorming |
| `#type/reference` | Reference | Documentation, tutorials, guides |
| `#type/conversation` | Conversation | AI chat, discussion, meeting records |
| `#type/decision` | Decision | ADR, important decisions, rationale |

---

## Status (`#status/`)

| Tag | Meaning | Usage |
|-----|---------|-------|
| `#status/draft` | Draft | Note is incomplete, being worked on |
| `#status/active` | Active | Active note/project/task |
| `#status/done` | Done | Completed, no longer actively working on |
| `#status/archived` | Archived | Old, outdated, move to archive/ |

---

## Projects (`#project/`)

| Tag | Project |
|-----|---------|
| `#project/opencode-chat` | OpenCode Chat Obsidian plugin |
| `#project/opencode-obsidian-ai-workspace` | This workspace project |

*Note: When creating a new project, add its tag here.*

---

## Topics (`#topic/`)

| Tag | Topic |
|-----|-------|
| `#topic/ai` | Artificial intelligence, LLMs, agents |
| `#topic/infrastructure` | Infrastructure, servers, configuration |
| `#topic/development` | Software development, programming |
| `#topic/obsidian` | Obsidian app, plugins, workflow |
| `#topic/integration` | Integrations between systems |
| `#topic/organization` | Note organization, PKM |
| `#topic/architecture` | Technical architecture, design decisions |
| `#topic/documentation` | Documentation, manuals |
| `#topic/workflow` | Workflows, processes |

*Note: Topics are flexible – create your own as needed (`#topic/new-topic`).*

---

## Priority (`#priority/`)

| Tag | Priority |
|-----|----------|
| `#priority/high` | High priority |
| `#priority/medium` | Medium priority |
| `#priority/low` | Low priority |

*Note: Use primarily for tasks (`#type/task`).*

---

## Searching with tags

### In Obsidian search:

**Find all project notes:**
```
tag:#type/project
```

**Find active tasks:**
```
tag:#type/task tag:#status/active
```

**Find everything related to a project:**
```
tag:#project/opencode-chat
```

**Combined search (project + type):**
```
tag:#project/opencode-chat tag:#type/reference
```

**High-priority tasks:**
```
tag:#type/task tag:#priority/high
```

---

## Dataview queries (advanced)

If you have the **Dataview plugin** installed:

### All active projects:

```dataview
TABLE created, updated
FROM #type/project AND #status/active
SORT updated DESC
```

### Incomplete tasks:

```dataview
TASK
FROM #type/task
WHERE !completed
```

### Notes in a specific project:

```dataview
LIST
FROM #project/opencode-chat
SORT file.name
```

---

**Tip:** Update this index whenever you add new tags.
