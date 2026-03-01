---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/obsidian
---
# OpenCode Obsidian AI Workspace – Vault Štruktúra

Tento dokument popisuje organizačný systém vaultu a ako ho nainštalovať.

**Súvisiace dokumenty:**
- [[02-bedrock-nastavenie]] – Predchádzajúci krok
- [[04-workflow]] – Nasledujúci krok

---

## Filozofia organizácie

**Jednoduchosť na prvom mieste:**
- Minimálna priečinková štruktúra
- Sémantická organizácia cez **tagy** (nie cez priečinky)
- AI agent "vie" ako pracovať vďaka `system/opencode-rules.md` – pravidlá sa načítajú automaticky pri každej session
- Každý typ poznámky má **šablónu** → konzistentnosť bez námahy

**Jazyk system/ a templates/:** Súbory sú v angličtine – agent Claude reaguje v jazyku, v ktorom s ním komunikuješ (SK prompt → SK odpoveď). Sekcie šablón (Overview, Goals...) sú EN, obsah poznámok píšeš v akomkoľvek jazyku.

---

## Priečinková štruktúra

```
vault/
├── system/                ← pravidlá a návody pre agenta + teba
│   ├── opencode-rules.md  ← hlavné pravidlá pre OpenCode agenta
│   ├── quick-guide.md     ← rýchly návod pre teba
│   └── tag-index.md       ← všetky tagy a ich popis
├── templates/             ← šablóny pre každý typ poznámky
│   ├── project.md
│   ├── task.md
│   ├── note.md
│   ├── reference.md
│   ├── decision.md
│   └── conversation.md
├── projects/              ← aktívne projekty (jeden priečinok = jeden projekt)
│   └── [projekt-meno]/
├── archive/               ← archivované poznámky a projekty
└── conversations/         ← záznamy AI konverzácií
```

---

## Tag systém

Tagy sú **primárny spôsob organizácie** – dôležitejšie ako priečinky.

### Povinné tagy (každá poznámka musí mať aspoň jeden)

**Typ poznámky (`#type/`):**

| Tag | Použitie |
|---|---|
| `#type/project` | Projektová poznámka, prehľad projektu |
| `#type/task` | Úloha, to do |
| `#type/note` | Voľná poznámka, myšlienka |
| `#type/reference` | Dokumentácia, tutorial, návod |
| `#type/conversation` | Záznam AI konverzácie |
| `#type/decision` | Rozhodnutie (ADR) |

**Status (`#status/`):**

| Tag | Použitie |
|---|---|
| `#status/draft` | Rozpracované |
| `#status/active` | Aktívne |
| `#status/done` | Hotové |
| `#status/archived` | Archivované |

### Odporúčané tagy

**Projekt:** `#project/[nazov-projektu]`

**Téma:** `#topic/ai`, `#topic/development`, `#topic/obsidian`, `#topic/infrastructure`, ...

**Priorita (pre úlohy):** `#priority/high`, `#priority/medium`, `#priority/low`

---

## Frontmatter štandard

Každá poznámka má YAML frontmatter:

```yaml
---
created: 2026-03-01
updated: 2026-03-01
tags:
  - type/project
  - status/active
  - project/moj-projekt
  - topic/development
---
```

---

## Inštalácia vault štruktúry

### Možnosť A: GitHub Release (odporúčané)

Stiahni ZIP z GitHub releases:

```
https://github.com/[username]/opencode-obsidian-ai-workspace/releases
```

Rozbaľ do koreňa vaultu:

```bash
unzip opencode-obsidian-ai-workspace.vX.Y.Z.zip -d /CESTA/K/VAULTU/
```

ZIP obsahuje:
- `system/` → rozbalí sa do `vault/system/` (EN pravidlá pre agenta)
- `templates/` → rozbalí sa do `vault/templates/` (EN sekcie, obsah v ľubovoľnom jazyku)
- `opencode-obsidian-ai-workspace.vX.Y.Z/` → manuály

### Možnosť B: Klonovanie z GitHub repo

```bash
git clone https://github.com/[username]/opencode-obsidian-ai-workspace.git /tmp/workspace-repo

cp -r /tmp/workspace-repo/system/* /CESTA/K/VAULTU/system/
cp -r /tmp/workspace-repo/templates/* /CESTA/K/VAULTU/templates/

rm -rf /tmp/workspace-repo
```

---

## Kľúčové súbory – prehľad

### `system/opencode-rules.md`

**Najdôležitejší súbor.** Definuje pravidlá pre AI agenta:
- Priečinková štruktúra a kde ukladať poznámky
- Tag hierarchia (povinné tagy, odporúčané)
- Frontmatter štandard
- Ako používať šablóny
- Pomenovanie súborov (malé písmená, pomlčky)
- Workflow: vytvorenie, aktualizácia, archivácia

Súbor je v angličtine – agent Claude ho pochopí a odpovedá v tvojom jazyku. Pravidlá sa načítajú automaticky pri každej session cez `rules-path` konfiguráciu pluginu.

### `system/quick-guide.md`

Stručný návod **pre teba** – ako vyhľadávať, vytvárať poznámky, workflow.

### `system/tag-index.md`

Kompletný zoznam všetkých tagov v tvojom vaulte s vysvetlením. Pridávaj sem nové tagy ak ich vytvoríš.

### `templates/`

Šablóny pre každý typ poznámky. Sekcie sú v angličtine (Overview, Goals, Description...) – obsah vypĺňaš v akomkoľvek jazyku. Agent ich automaticky používa pri vytváraní nových poznámok.

---

## Overenie inštalácie

Po inštalácii over v OpenCode Chat:

```
Zhrň pravidlá pre organizáciu poznámok v tomto vaulte
```

AI by mala zhrnúť pravidlá zo `system/opencode-rules.md` – načítavajú sa automaticky.

Potom otestuj vytvorenie poznámky:

```
Vytvor projektovú poznámku pre projekt "test-workspace"
```

AI by mala:
1. Načítať `templates/project.md`
2. Vyplniť placeholdery
3. Vytvoriť `projects/test-workspace/prehľad.md`
4. Pridať správne tagy a frontmatter

**✅ Checkpoint:** Vault štruktúra funguje, agent používa pravidlá a šablóny

---

## Prispôsobenie pre vlastný workflow

### Pridanie vlastných pravidiel

Uprav `system/opencode-rules.md` – pridaj sekciu:

```markdown
## Vlastné pravidlá

### Jazyk poznámok
- Primárny jazyk: slovenčina
- Technické termíny: angličtina

### Projekty
- Každý projekt má podpriečinky: docs/, tasks/
- Archivované projekty: archive/YYYY/[projekt]/

### Úlohy
- Deadline vo frontmatter: `due: YYYY-MM-DD`
```

### Vytvorenie vlastnej šablóny

Skopíruj existujúcu šablónu a uprav:

```
AI: Skopíruj templates/note.md do templates/meeting.md a pridaj sekcie: Účastníci, Agenda, Akčné body
```

---

**Ďalší krok:** [[04-workflow]] – Denný workflow a scenáre
