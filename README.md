# OpenCode Obsidian AI Workspace

> Privacy-first AI workspace for Obsidian: OpenCode + Amazon Bedrock + structured vault guidelines.

---

## What is this?

OpenCode Obsidian AI Workspace is a complete personal setup for AI-assisted work in an Obsidian vault. It combines:

1. **Amazon Bedrock** as the LLM provider – GDPR compliant, EU region, no logging
2. **Vault guidelines** – rules, templates, and tag structure for consistent note organization
3. **Manuals** (SK + EN) – step-by-step guides to deploy and use the full setup

The AI agent automatically knows how to work with your vault thanks to `system/opencode-rules.md`, loaded at every session start via the OpenCode Chat plugin's `rules-path` configuration.

### Requires

- [OpenCode](https://opencode.ai) – AI agent engine (local server)
- [OpenCode Chat plugin](https://github.com/rho-sk/opencode-chat) – Obsidian plugin providing the chat UI
- Amazon Bedrock account (or API key from your administrator)

---

## Installation

Download the latest release ZIP from [Releases](https://github.com/rho-sk/opencode-obsidian-ai-workspace/releases) and extract it to your vault root:

```bash
unzip opencode-obsidian-ai-workspace.vX.Y.Z.zip -d /PATH/TO/YOUR/VAULT/
```

The ZIP installs:
- `system/` → vault root (agent rules, quick guide, tag index)
- `templates/` → vault root (note templates for every type)
- `opencode-obsidian-ai-workspace.vX.Y.Z/` → manuals (SK + EN)

---

## Vault structure after installation

```
vault/
├── system/
│   ├── opencode-rules.md   ← agent rules (loaded automatically)
│   ├── quick-guide.md      ← quick reference for you
│   └── tag-index.md        ← all tags with descriptions
├── templates/
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── projects/
├── archive/
└── conversations/
```

---

## Manuals

| Language | Files |
|---|---|
| Slovak | `opencode-obsidian-ai-workspace.vX.Y.Z/manual/sk/` |
| English | `opencode-obsidian-ai-workspace.vX.Y.Z/manual/en/` |

Manual chapters:
- `00` – Introduction / Úvod
- `01` – Prerequisites / Predpoklady
- `02` – Amazon Bedrock setup / Nastavenie Bedrock
- `03` – Vault structure / Vault štruktúra
- `04` – Daily workflow / Denný workflow

---

## Privacy

- **EU region** (`eu-central-1`) – GDPR compliant, data stays in the EU
- **No logging** – Bedrock does not store prompts or responses
- **Stateless API** – no data persistence on the AWS side
- **Vault files stay local** – read directly from your filesystem via MCP

More: https://aws.amazon.com/bedrock/data-protection/

---

## Cost (Amazon Bedrock Claude models)

| Model | Input | Output |
|---|---|---|
| Claude Sonnet 4.6 | $3 / 1M tokens | $15 / 1M tokens |
| Claude Haiku 4.6  | $1 / 1M tokens | $5 / 1M tokens  |

Typical usage: ~$5–10/month.

---

## License

MIT
