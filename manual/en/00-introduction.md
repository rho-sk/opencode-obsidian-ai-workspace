---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
---
# OpenCode Obsidian AI Workspace – Introduction

## What is OpenCode Obsidian AI Workspace?

OpenCode Obsidian AI Workspace is a **complete personal setup** for AI-assisted work in an Obsidian vault with a focus on **data privacy**. It builds on the OpenCode Chat plugin and adds:

1. **Amazon Bedrock** as the LLM provider – maximum privacy, GDPR, EU region
2. **Vault guidelines** – a note organization system (rules, templates, tags)
3. **Manuals** – step-by-step guides to deploy and use the full solution

### Relationship to opencode-chat

This project **depends on** the [[../../opencode-chat/manual/en/00-introduction|OpenCode Chat plugin]]:

```
opencode-chat plugin           → AI chat in Obsidian (works with any provider)
         +
opencode-obsidian-ai-workspace → my specific setup: Bedrock + vault guidelines
```

---

## Why Amazon Bedrock?

### Privacy-first

When working with personal notes in an Obsidian vault, it matters who processes your data.

**Amazon Bedrock:**

- ✅ **EU region** (`eu-central-1`) – GDPR compliant, data stays in the EU
- ✅ **No logging** – Bedrock does not store your prompts or responses
- ✅ **Stateless API** – no data persistence on the AWS side after request completion
- ✅ **AWS Terms of Service** – AWS commits to not using your data for model training
- ✅ **Vault files stay local** – mcp-obsidian reads directly from the filesystem

**LLM provider comparison:**

| Provider | Privacy | GDPR | Cost |
|---|---|---|---|
| **Amazon Bedrock** | No logging, EU region | ✅ Yes | ~$5-10/month |
| Ollama (local) | 100% offline | ✅ Yes | Free (higher HW) |
| Anthropic API direct | Anthropic terms | ⚠️ Depends | ~$5-15/month |
| OpenAI API | OpenAI terms | ⚠️ Depends | ~$5-20/month |
| ChatGPT / Claude web | Training data | ❌ No | $20/month |

**Bedrock data privacy docs:** https://aws.amazon.com/bedrock/data-protection/

---

## What do you get after installation?

### 1. Privacy-first AI assistant

```
You: "Analyze project X and suggest next steps"
AI:  *Reads notes from projects/project-x/*
     *Returns analysis – your data never left AWS EU region*
```

### 2. Structured vault

```
vault/
├── x-ai-rules/            ← rules for the AI agent
│   ├── opencode-rules.md  ← how to organize notes
│   ├── quick-guide.md     ← quick guide for you
│   └── tag-index.md       ← complete tag list
├── x-ai-templates/        ← templates for every note type
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── projects/              ← active projects
├── archive/               ← archived notes
└── conversations/         ← AI conversation records
```

### 3. Consistent organization

Every note has:
- **Frontmatter** – created, tags, updated
- **Type tags** – `#type/project`, `#type/task`, `#type/note`, ...
- **Status tags** – `#status/active`, `#status/done`, ...
- **Topic tags** – `#topic/ai`, `#topic/development`, ...

### 4. The AI agent "knows" how to work with your vault

Thanks to `x-ai-rules/opencode-rules.md`, the agent automatically:
- Uses the correct templates
- Adds consistent tags
- Saves files to the right folders
- Links related notes

---

## Architecture

```
┌──────────────────────────────┐
│  Obsidian Desktop            │  ← You write notes
│  ┌──────────────────────┐    │
│  │ OpenCode Chat Plugin │    │  ← Chat interface
│  └──────────┬───────────┘    │
└─────────────┼────────────────┘
              │ HTTP API (localhost:4096)
              ▼
┌──────────────────────────────┐
│  OpenCode Server (local)     │  ← AI agent engine
└──────────────┬───────────────┘
               │ AWS Bedrock API
               ▼
┌──────────────────────────────┐
│  Amazon Bedrock (eu-central-1)│  ← Claude Sonnet 4.6 / Haiku 4.6
│  GDPR, no logging            │
└──────────────┬───────────────┘
               │ MCP Protocol
               ▼
┌──────────────────────────────┐
│  mcp-obsidian                │  ← Vault file access
│  (reads from filesystem)     │
└──────────────┬───────────────┘
               │ Filesystem I/O
               ▼
┌──────────────────────────────┐
│  Obsidian Vault              │  ← Notes stay local
│  x-ai-rules/ + x-ai-templates/  │  ← Vault guidelines
└──────────────────────────────┘
```

---

## Cost

### Amazon Bedrock (Claude models)

| Model | Input ($/1M tokens) | Output ($/1M tokens) | Best for |
|---|---|---|---|
| **Claude Sonnet 4.6** | $3 | $15 | Complex tasks, analysis, code |
| **Claude Haiku 4.6**  | $1 | $5  | Simple queries, search |

**Real-world usage:**
- 100-200 messages/day (mix Sonnet + Haiku): **~$5-10 / month**
- Power user (500+ messages/day): **~$20-30 / month**

**Tip:** Use Haiku for simple tasks (search, tagging) and Sonnet for complex ones (content generation, analysis).

---

## Language strategy

### Why are `x-ai-rules/` and `x-ai-templates/` in English?

The files `x-ai-rules/opencode-rules.md`, `x-ai-rules/quick-guide.md`, `x-ai-rules/tag-index.md`, and all `x-ai-templates/` are in **English**. The reason is practical:

- Claude works most reliably with English instructions
- English rules work for all users regardless of their language
- **You communicate with the agent in any language** – the agent responds in the same language (write in Slovak → get Slovak responses)
- Template sections (Overview, Goals, Description...) are in English, but you write note content in any language


---

## Next step

👉 **[[01-prerequisites]]** – What needs to be installed before this setup

---

## FAQ

### Do I need an AWS account?
Yes, for Amazon Bedrock. Creating an AWS account is free; you only pay for actual API calls.

### Can I use a different LLM provider?
Yes – the opencode-chat plugin is provider-agnostic. If you want to use Ollama, Anthropic API, or another provider, see the [[../../opencode-chat/manual/en/01-installation|opencode-chat installation guide]]. This workspace project focuses on Bedrock setup.

### What if I already have a vault with notes?
System rules and templates are additive – they don't overwrite existing notes. You can add them to an existing vault without issues.

### Is this secure?
Yes. Vault files always stay local. Only prompts/responses go via AWS Bedrock (GDPR, no logging).
