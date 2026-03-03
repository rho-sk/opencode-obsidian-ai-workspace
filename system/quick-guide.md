---
created: '2026-03-01'
tags:
  - type/reference
  - topic/obsidian
  - topic/organization
type: guide
---
# Obsidian Vault – Quick Guide

Your personal reference for using this note organization system.

---

## Core idea

**Folders** = minimal, only for projects
**Tags** = semantic organization, how you find notes

Don't worry too much about where to save something. **Tags** matter more than the folder structure.

---

## Creating a new note

### 1. Manually

1. Create a new note
2. Copy the content of the appropriate template from `templates/`
3. Fill in `{{placeholders}}`
4. Save wherever makes sense (preferably inside a project)

### 2. Via the OpenCode agent

Type in chat:
> "Create a note for project X"
> "Add a task: deploy configuration to production"
> "Record a decision: we'll use Amazon Bedrock"

The agent will automatically:
- Choose the right template
- Fill in frontmatter and tags
- Save to the correct folder

---

## Finding notes

### In Obsidian search (Ctrl+Shift+F):

**All project notes:**
```
tag:#type/project
```

**Active tasks:**
```
tag:#type/task tag:#status/active
```

**Everything about project bedrock:**
```
tag:#project/bedrock
```

**AI conversations about AI topics:**
```
tag:#type/conversation tag:#topic/ai
```

### Complex search:

```
tag:#type/task tag:#status/active tag:#priority/high
```

---

## Workflow

### Starting a new project?

1. Ask OpenCode: *"Create project: project name"*
2. The agent creates the structure in the configured projects folder (default: `projects/project-name/`)
3. All project notes will have the tag `#project/project-name`

### Need to capture a thought?

1. Create a note anywhere (even in root)
2. Add tags: `#type/note #topic/relevant-topic`
3. Done – you'll find it by tag

### Have a task?

1. OpenCode: *"Add a task: ..."*
2. Agent creates it in the project, adds tags
3. Find tasks via `tag:#type/task tag:#status/active`

### Archiving old notes?

1. Change tag to `#status/archived`
2. OpenCode can move them to `archive/`

---

## Tips

### Don't fear the chaos

- Notes can be anywhere; tags are what matters
- If you're not sure where to put something, drop it in root with good tags

### Link your notes

- In every note, reference related ones `[[other-file]]`
- Build a network of notes, not a tree

### Use Graph View

- Obsidian: `Ctrl+G` → see the link graph
- Works best when notes are interlinked

### Review regularly

- Occasionally search `tag:#status/active`
- Check what's done → change to `#status/done`

---

## Recommended Obsidian plugins

### Already using:
- **OpenCode Chat** – AI agent with MCP vault access

### Recommended:
- **Dataview** – advanced note queries (SQL-like)
- **Templater** – advanced templates with logic
- **Tag Wrangler** – tag management (rename, merge)
- **Recent Files** – quick access to recent files

---

## FAQ

**Q: Where to save a note that belongs to multiple projects?**
A: Put it in one project and add tags for both: `#project/a #project/b`

**Q: Can I create a custom tag?**
A: Yes! E.g. `#topic/my-topic`. Just follow the format `category/name`.

**Q: What if I don't need all sections from a template?**
A: Delete them. Templates are just suggestions.

**Q: Can I use subdirectories inside projects?**
A: Yes, e.g. `projects/bedrock/docs/`, `projects/bedrock/configs/`. Tags still apply.

**Q: How do I mark a note that is both a task and a note?**
A: Pick the primary type. Task = has an action to complete. Note = free-form record.

---

## Note lifecycle example

1. **Creation:** *"OpenCode, add a task: deploy CORS configuration"*
   - Agent creates the task in the configured projects folder (e.g. `projects/opencode/deploy-cors-configuration.md`)
   - Tags: `#type/task #status/active #project/opencode #priority/high`

2. **Work:** Add notes, links to related files

3. **Completion:** Change `#status/active` → `#status/done`

4. **Archiving (later):** Change to `#status/archived`, move to `archive/`
