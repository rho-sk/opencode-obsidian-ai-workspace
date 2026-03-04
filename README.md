# OpenCode Obsidian AI Workspace

> AI-assisted Obsidian vault with **Amazon Bedrock**, vault guidelines, and ready-made templates – packaged for easy distribution.

---

## What is this?

OpenCode Obsidian AI Workspace is a complete personal setup for AI-assisted work in an Obsidian vault with a focus on **data privacy**. It builds on the OpenCode Chat plugin and adds:

1. **Amazon Bedrock configuration** – privacy-first LLM provider (GDPR, EU region, no logging)
2. **Vault guidelines** – AI agent rules, templates, and tag structure for consistent note organization
3. **Manuals** (SK + EN) – step-by-step guides for new users

### Relationship to opencode-chat

This project **builds on** the [opencode-chat](https://github.com/rho-sk/opencode-chat) plugin:

```
opencode-chat plugin           → universal AI chat in Obsidian (provider-agnostic)
         +
opencode-obsidian-ai-workspace → my specific setup: Bedrock + vault guidelines
```

You need to complete the opencode-chat plugin installation first.

---

## Repository structure

```
opencode-obsidian-ai-workspace/
├── build/
│   └── build.sh                    # build script for release ZIP
├── x-ai-rules/                     # vault guidelines for the AI agent (EN)
│   ├── opencode-rules.md           # rules for the OpenCode agent
│   ├── quick-guide.md              # quick reference for the user
│   └── tag-index.md                # complete tag list
├── x-ai-templates/                 # note templates (EN sections)
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── manual/
│   ├── sk/                         # Slovak manual
│   └── en/                         # English manual
└── README.md
```

---

## Getting started (EN)

1. [Introduction – What is this workspace and why Bedrock](manual/en/00-introduction.md) (5 min)
2. [Prerequisites – What needs to be running first](manual/en/01-prerequisites.md) (10 min)
3. [Bedrock Setup – Configure Amazon Bedrock](manual/en/02-bedrock-setup.md) (15–20 min)
4. [Vault Structure – Install vault guidelines](manual/en/03-vault-structure.md) (10 min)
5. [Workflow – Learn to use it](manual/en/04-workflow.md) (20 min reading)

## Začíname (SK)

1. [Úvod – Čo je workspace a prečo Bedrock](manual/sk/00-uvod.md) (5 min)
2. [Predpoklady – Čo musí bežať pred týmto](manual/sk/01-predpoklady.md) (10 min)
3. [Bedrock nastavenie – Konfigurácia Amazon Bedrock](manual/sk/02-bedrock-nastavenie.md) (15–20 min)
4. [Vault štruktúra – Nainštaluj vault guidelines](manual/sk/03-vault-struktura.md) (10 min)
5. [Workflow – Nauč sa používať](manual/sk/04-workflow.md) (20 min čítanie)

---

## Installation from GitHub Release

Download the latest release ZIP from [Releases](https://github.com/rho-sk/opencode-obsidian-ai-workspace/releases) and extract it to your vault root:

```bash
unzip opencode-obsidian-ai-workspace.vX.Y.Z.zip -d /PATH/TO/YOUR/VAULT/
```

### What the ZIP contains

```
opencode-obsidian-ai-workspace.vX.Y.Z.zip
├── x-ai-rules/                     ← extracts to vault root
│   ├── opencode-rules.md           ← AI agent rules
│   ├── quick-guide.md
│   └── tag-index.md
├── x-ai-templates/                 ← extracts to vault root
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
└── opencode-obsidian-ai-workspace.vX.Y.Z/   ← versioned directory (manuals)
    ├── README.md
    └── manual/
        ├── sk/
        └── en/
```

After extraction your vault will contain:

```
vault/
├── x-ai-rules/
├── x-ai-templates/
└── opencode-obsidian-ai-workspace.vX.Y.Z/   ← no conflict with existing folders
    └── manual/
```

> **Language note:** `x-ai-rules/` and `x-ai-templates/` are in English – Claude responds in whatever language you write in (write in Slovak → get Slovak responses). Template section headers (Overview, Goals...) are in English, but note content can be written in any language.

---

## Data Privacy

**Why Amazon Bedrock:**

- EU region `eu-central-1` – GDPR compliant
- No logging – Bedrock does not store prompts or responses
- Stateless API – no data persistence on the AWS side
- AWS Terms of Service – your data is not used for model training
- Vault files always stay local

**Docs:** https://aws.amazon.com/bedrock/data-protection/

---

## Links

- [OpenCode](https://opencode.ai)
- [mcp-obsidian](https://github.com/mauriciowolff/mcp-obsidian)
- [Amazon Bedrock](https://aws.amazon.com/bedrock/)
