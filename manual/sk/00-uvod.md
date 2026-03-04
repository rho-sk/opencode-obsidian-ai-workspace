---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
---
# OpenCode Obsidian AI Workspace – Úvod

## Čo je OpenCode Obsidian AI Workspace?

OpenCode Obsidian AI Workspace je **kompletný osobný setup** pre AI-asistovanú prácu v Obsidian vaulte. Stavia na OpenCode Chat plugine a pridáva:

1. **Amazon Bedrock** ako LLM provider – maximálna privacy, GDPR, EU región
2. **Vault guidelines** – systém organizácie poznámok (pravidlá, šablóny, tagy)
3. **Manuály** – krok za krokom návod ako celé riešenie nasadiť a používať

### Vzťah k opencode-chat

Tento projekt **predpokladá** nainštalovaný [[../../opencode-chat/manual/sk/00-uvod|OpenCode Chat plugin]]:

```
opencode-chat plugin          → AI chat v Obsidiane (funguje s akýmkoľvek providerom)
         +
opencode-obsidian-ai-workspace → môj setup: Bedrock + vault organizácia
```

---

## Prečo Amazon Bedrock?

### Privacy na prvom mieste

Pri práci s osobnými poznámkami v Obsidian vaulte záleží na tom, kto spracováva tvoje dáta.

**Amazon Bedrock:**

- ✅ **EU región** (`eu-central-1`) – GDPR compliant, dáta zostávajú v EÚ
- ✅ **Žiadne logovanie** – Bedrock neukladá tvoje prompty ani odpovede
- ✅ **Stateless API** – žiadna perzistencia dát na AWS strane po dokončení volania
- ✅ **AWS Terms of Service** – AWS sa zaväzuje, že nepoužije tvoje dáta na tréning modelov
- ✅ **Vault súbory zostávajú lokálne** – mcp-obsidian číta priamo z filesystému

**Porovnanie LLM providerov:**

| Provider | Privacy | GDPR | Náklady |
|---|---|---|---|
| **Amazon Bedrock** | Žiadne logovanie, EU región | ✅ Áno | ~$5-10/mesiac |
| Ollama (lokálne) | 100% offline | ✅ Áno | Zadarmo (vyšší HW) |
| Anthropic API direct | Anthropic podmienky | ⚠️ Závisí | ~$5-15/mesiac |
| OpenAI API | OpenAI podmienky | ⚠️ Závisí | ~$5-20/mesiac |
| ChatGPT / Claude web | Tréningové dáta | ❌ Nie | $20/mesiac |

**Dokumentácia Bedrock data privacy:** https://aws.amazon.com/bedrock/data-protection/

---

## Čo získaš po inštalácii?

### 1. Privacy-first AI asistent

```
Ty: "Analyzuj projekt X a navrhni ďalšie kroky"
AI: *Prečíta poznámky z projects/projekt-x/*
    *Vráti analýzu – tvoje dáta neopustili AWS EU región*
```

### 2. Štruktúrovaný vault

```
vault/
├── x-ai-rules/            ← pravidlá pre AI agenta
│   ├── opencode-rules.md  ← ako organizovať poznámky
│   ├── quick-guide.md     ← rýchly návod pre teba
│   └── tag-index.md       ← kompletný zoznam tagov
├── x-ai-templates/        ← šablóny pre každý typ poznámky
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── projects/              ← aktívne projekty
├── archive/               ← archivované poznámky
└── conversations/         ← záznamy AI konverzácií
```

### 3. Konzistentná organizácia

Každá poznámka má:
- **Frontmatter** – created, tags, updated
- **Type tagy** – `#type/project`, `#type/task`, `#type/note`, ...
- **Status tagy** – `#status/active`, `#status/done`, ...
- **Topic tagy** – `#topic/ai`, `#topic/development`, ...

### 4. AI agent "vie" ako pracovať s vaultom

Vďaka `x-ai-rules/opencode-rules.md` agent automaticky:
- Používa správne šablóny
- Pridáva konzistentné tagy
- Ukladá do správnych priečinkov
- Linkuje súvisiace poznámky

---

## Architektúra riešenia

```
┌──────────────────────────────┐
│  Obsidian Desktop            │  ← Ty píšeš poznámky
│  ┌──────────────────────┐    │
│  │ OpenCode Chat Plugin │    │  ← Chat rozhranie
│  └──────────┬───────────┘    │
└─────────────┼────────────────┘
              │ HTTP API (localhost:4096)
              ▼
┌──────────────────────────────┐
│  OpenCode Server (lokálne)   │  ← AI agent engine
└──────────────┬───────────────┘
               │ AWS Bedrock API
               ▼
┌──────────────────────────────┐
│  Amazon Bedrock (eu-central-1)│  ← Claude Sonnet 4.6 / Haiku 4.6
│  GDPR, žiadne logovanie      │
└──────────────┬───────────────┘
               │ MCP Protocol
               ▼
┌──────────────────────────────┐
│  mcp-obsidian                │  ← Prístup k vault súborom
│  (číta z filesystem)         │
└──────────────┬───────────────┘
               │ Filesystem I/O
               ▼
┌──────────────────────────────┐
│  Obsidian Vault              │  ← Poznámky zostávajú lokálne
│  x-ai-rules/ + x-ai-templates/ │  ← Vault guidelines
└──────────────────────────────┘
```

---

## Náklady

### Amazon Bedrock (Claude modely)

| Model | Input ($/1M tokenov) | Output ($/1M tokenov) | Odporúčané pre |
|---|---|---|---|
| **Claude Sonnet 4.6** | $3 | $15 | Komplexné úlohy, analýza, kód |
| **Claude Haiku 4.6**  | $1 | $5  | Jednoduché otázky, vyhľadávanie |

**Reálne použitie:**
- 100-200 správ denne (mix Sonnet + Haiku): **~$5-10 / mesiac**
- Power user (500+ správ denne): **~$20-30 / mesiac**

**Tip:** Použi Haiku pre jednoduché úlohy (vyhľadávanie, tagovanie) a Sonnet pre komplexné (generovanie obsahu, analýza).

---

## Jazyková stratégia

### Prečo sú `x-ai-rules/` a `x-ai-templates/` v angličtine?

Súbory `x-ai-rules/opencode-rules.md`, `x-ai-rules/quick-guide.md`, `x-ai-rules/tag-index.md` a všetky `x-ai-templates/` sú v **angličtine**. Dôvod je praktický:

- Agent Claude pracuje s angličtinou najspoľahlivejšie
- EN pravidlá fungujú pre každého používateľa bez ohľadu na jeho jazyk
- **Ty komunikuješ s agentom v akomkoľvek jazyku** – agent odpovedá rovnakým jazykom (SK prompt → SK odpoveď)
- Sekcie šablón (Overview, Goals, Description...) sú EN, ale obsah poznámok píšeš v SK alebo EN alebo akomkoľvek jazyku


---

## Ďalší krok

👉 **[[01-predpoklady]]** – Čo musí byť nainštalované pred týmto setupom

---

## FAQ

### Potrebujem AWS účet?
Áno, pre Amazon Bedrock. Vytvorenie AWS účtu je zadarmo, platíš len za skutočné API volania.

### Môžem použiť iný LLM provider?
Áno – opencode-chat plugin je provider-agnostický. Ak chceš použiť Ollama, Anthropic API alebo iný provider, pozri [[../../opencode-chat/manual/sk/01-instalacia|opencode-chat inštaláciu]]. Tento workspace projekt sa zameriava na Bedrock setup.

### Čo ak už mám vault s poznámkami?
System rules a templates sú aditívne – neprepisujú existujúce poznámky. Môžeš ich pridať do existujúceho vaultu bez problémov.

### Je to bezpečné?
Áno. Vault súbory zostávajú lokálne vždy. Cez internet idú len prompty/odpovede cez AWS Bedrock (GDPR, žiadne logovanie).
