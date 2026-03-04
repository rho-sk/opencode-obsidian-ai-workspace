---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/ai
  - topic/obsidian
updated: '2026-03-01'
---
# OpenCode Obsidian AI Workspace

> AI-asistovaný Obsidian vault s **Amazon Bedrock**, vault guidelines a hotovými šablónami – pripravený na distribúciu.

---

## Čo je tento projekt?

OpenCode Obsidian AI Workspace je kompletný osobný setup pre AI-asistovanú prácu v Obsidian vaulte. Obsahuje:

1. **Konfigurácia Amazon Bedrock** – privacy-first LLM provider (GDPR, EU región, žiadne logovanie)
2. **Vault guidelines** – system rules, templates a tag štruktúra pre konzistentnú organizáciu poznámok
3. **Manuály** (SK + EN) – krok za krokom návod pre nových používateľov

### Vzťah k opencode-chat

Tento projekt **stavia na** [[../opencode-chat/README|opencode-chat]] plugine:

```
opencode-chat plugin          → univerzálny AI chat v Obsidiane (provider-agnostický)
         +
opencode-obsidian-ai-workspace → môj konkrétny setup: Bedrock + vault guidelines
```

Inštaláciu opencode-chat pluginu **musíš dokončiť skôr** – pozri [[../opencode-chat/manual/sk/01-instalacia|01-instalacia]].

---

## Štruktúra projektu

```
projects/opencode-obsidian-ai-workspace/
├── README.md                           # Tento súbor
├── prehľad.md                          # Projektová poznámka (status, ciele)
├── architektura.md                     # Vzťah komponentov
├── github-repo-instrukcie.md           # GitHub repo, build, releases
├── x-ai-rules/                         # ZDROJOVÉ vault guidelines (EN)
│   ├── opencode-rules.md               # Pravidlá pre OpenCode agenta
│   ├── quick-guide.md                  # Rýchly návod pre používateľa
│   └── tag-index.md                    # Kompletný zoznam tagov
├── x-ai-templates/                     # ZDROJOVÉ šablóny (EN sekcie)
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
└── manual/
    ├── sk/
    │   ├── 00-uvod.md
    │   ├── 01-predpoklady.md
    │   ├── 02-bedrock-nastavenie.md
    │   ├── 03-vault-struktura.md
    │   └── 04-workflow.md
    └── en/
        ├── 00-introduction.md
        ├── 01-prerequisites.md
        ├── 02-bedrock-setup.md
        ├── 03-vault-structure.md
        └── 04-workflow.md
```

> **`x-ai-rules/` a `x-ai-templates/` v roote vaultu** (`vault/x-ai-rules/`, `vault/x-ai-templates/`) sú **nainštalovaná verzia** z release ZIP – needitovať priamo. Zdrojové súbory sú tu v projekte.

---

## Pre nových používateľov (SK)

1. **[[manual/sk/00-uvod]]** – Čo je workspace a prečo Bedrock (5 min)
2. **[[manual/sk/01-predpoklady]]** – Čo musí bežať pred týmto (10 min)
3. **[[manual/sk/02-bedrock-nastavenie]]** – Bedrock setup (15-20 min)
4. **[[manual/sk/03-vault-struktura]]** – Nainštaluj vault guidelines (10 min)
5. **[[manual/sk/04-workflow]]** – Nauč sa používať (20 min čítanie)

## For new users (EN)

1. **[[manual/en/00-introduction]]** – What is this workspace and why Bedrock (5 min)
2. **[[manual/en/01-prerequisites]]** – What needs to be running first (10 min)
3. **[[manual/en/02-bedrock-setup]]** – Bedrock configuration (15-20 min)
4. **[[manual/en/03-vault-structure]]** – Install vault guidelines (10 min)
5. **[[manual/en/04-workflow]]** – Learn to use it (20 min reading)

---

## Inštalácia z GitHub Release

Pre nových používateľov je k dispozícii **release ZIP** na GitHub:

```
https://github.com/[username]/opencode-obsidian-ai-workspace/releases
```

### Čo obsahuje ZIP

```
opencode-obsidian-ai-workspace.vX.Y.Z.zip
├── x-ai-rules/                 ← vault guidelines, EN (rozbalí sa do vault root)
│   ├── opencode-rules.md       ← pravidlá pre agenta (agent komunikuje v tvojom jazyku)
│   ├── quick-guide.md
│   └── tag-index.md
├── x-ai-templates/             ← šablóny, EN sekcie (rozbalí sa do vault root)
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
└── opencode-obsidian-ai-workspace.vX.Y.Z/   ← manuály (verzionovaný adresár)
    ├── README.md
    └── manual/
        ├── sk/
        └── en/
```

> **Jazyková poznámka:** `x-ai-rules/` a `x-ai-templates/` sú v angličtine – agent Claude reaguje v jazyku, v ktorom s ním píšeš (SK prompt → SK odpoveď). Sekcie šablón (Overview, Goals...) sú EN, ale obsah poznámok píšeš v akomkoľvek jazyku.

### Inštalácia

```bash
# Rozbaľ ZIP do koreňa vaultu
unzip opencode-obsidian-ai-workspace.vX.Y.Z.zip -d /CESTA/K/VAULTU/
```

Po rozbalení bude vault obsahovať:
```
vault/
├── x-ai-rules/                                      ← vault guidelines
├── x-ai-templates/                                  ← šablóny
└── opencode-obsidian-ai-workspace.vX.Y.Z/       ← manuály (nekonflikuje)
    ├── README.md
    └── manual/
```

Verzia v názve adresára zabezpečuje, že **nedôjde ku konfliktu** s týmto projektovým adresárom (`projects/opencode-obsidian-ai-workspace/`) pri testovaní releasu.

---

## Data Privacy

**Prečo Amazon Bedrock:**

- ✅ EU región `eu-central-1` – GDPR compliant
- ✅ Žiadne logovanie – Bedrock neukladá prompty ani odpovede
- ✅ Stateless API – žiadna perzistencia dát na AWS strane
- ✅ AWS Terms of Service – dáta sa nepoužívajú na tréning modelov
- ✅ Vault súbory zostávajú lokálne vždy

**Dokumentácia:** https://aws.amazon.com/bedrock/data-protection/

---

## Linky

- **opencode-chat plugin:** [[../opencode-chat/README|opencode-chat]]
- **Architektúra:** [[architektura]]
- **GitHub repo instrukcie:** [[github-repo-instrukcie]]
- **OpenCode:** https://opencode.ai
- **MCP Obsidian:** https://github.com/mauriciowolff/mcp-obsidian
- **Amazon Bedrock:** https://aws.amazon.com/bedrock/

---

**Posledná aktualizácia:** 2026-03-01
