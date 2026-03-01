---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/obsidian
---
# OpenCode Obsidian AI Workspace – Workflow

Denný workflow a scenáre použitia.

**Súvisiace dokumenty:**
- [[03-vault-struktura]] – Predchádzajúci krok
- [[00-uvod]] – Úvod do projektu

---

## Ako funguje agent automaticky

OpenCode Chat plugin má konfiguračný parameter **`rules-path`**, ktorý ukazuje na `system/opencode-rules.md` (alebo celý priečinok `system/`). Pravidlá sa **automaticky načítajú na začiatku každej session** – nemusíš nič posielať manuálne.

Agent teda od prvej správy vie:
- kde ukladať poznámky
- aké tagy používať
- aké šablóny existujú
- ako formátovať frontmatter

Jednoducho začni písať.

---

## Scenáre použitia

### Scenár 1: Vytvorenie nového projektu

**Prompt:**
```
Create a new project note for project "my-api"
Project goal: Build a REST API for user management
Tech stack: Node.js, PostgreSQL
```

**Agent:**
1. Načíta `templates/project.md`
2. Vytvorí `projects/my-api/prehľad.md`
3. Vyplní frontmatter, tagy (`type/project`, `status/active`, `project/my-api`)
4. Vyplní sekcie zo šablóny tvojimi informáciami

---

### Scenár 2: Zaznamenanie rozhodnutia (ADR)

**Prompt:**
```
Record an architecture decision: We chose PostgreSQL over MongoDB for the my-api project.
Reason: ACID compliance needed, structured data, team expertise.
```

**Agent:**
1. Načíta `templates/decision.md`
2. Vytvorí `projects/my-api/decision-postgresql.md`
3. Vyplní kontextom, dôvodmi, dôsledkami

---

### Scenár 3: Vytvorenie úlohy

**Prompt:**
```
Create a task: Implement user authentication endpoint for my-api project.
Priority: high
```

**Agent:**
1. Načíta `templates/task.md`
2. Vytvorí `projects/my-api/task-implement-auth-endpoint.md`
3. Nastaví `type/task`, `status/active`, `priority/high`, `project/my-api`

---

### Scenár 4: Voľná poznámka / brainstorming

**Prompt:**
```
Create a note with my thoughts on caching strategies.
Key ideas: Redis for sessions, CDN for static assets, database query caching.
```

**Agent:**
1. Načíta `templates/note.md`
2. Vytvorí `notes/caching-strategies.md`
3. Zachytí myšlienky štruktúrovane

---

### Scenár 5: Vyhľadávanie a prehľad

**Prompt:**
```
List all active tasks for the my-api project
```

alebo

```
What decisions have been made for the my-api project?
```

Agent prehľadá vault podľa tagov a wikilinkov a vráti prehľad.

---

### Scenár 6: Aktualizácia stavu úlohy

**Prompt:**
```
Mark task-implement-auth-endpoint in my-api as done
```

**Agent:**
1. Nájde súbor
2. Aktualizuje `status/active` → `status/done`
3. Pridá `updated:` do frontmatter

---

### Scenár 7: Záznam AI konverzácie

Po dôležitej AI session môžeš požiadať o záznam:

**Prompt:**
```
Save this conversation as a conversation note.
Topic: Architecture decisions for my-api
```

**Agent:**
1. Načíta `templates/conversation.md`
2. Vytvorí `conversations/[dátum]-architecture-my-api.md`
3. Zhrnie kľúčové body konverzácie

---

## Tipy pre efektívny workflow

### Jazyk

- Komunikuj s agentom v akomkoľvek jazyku – odpovie rovnakým jazykom
- Sekcie šablón sú v EN (Overview, Goals...) – obsah píš v SK, EN alebo akomkoľvek jazyku

### Konzistentnosť tagov

Pri každej novej poznámke pomenuj typ a projekt:

```
Create a task note for project "my-api" with priority high
```

Bez kontextu môže agent použiť nesprávne tagy alebo priečinok.

### Archivovanie

Keď projekt skončí:

```
Archive the my-api project. Move it to archive/ and update status to archived.
```

### Iterácia na šablónach

Šablóny nie sú finálne – prispôsob ich:

```
Add a "Risk" section to templates/project.md
```

Zmena sa prejaví pri všetkých budúcich projektových poznámkach.

---

## Odporúčaný denný workflow

**Ráno:**
```
What active tasks do I have?
```

**Počas práce:**
- Vytváraj poznámky priebežne ("vytvor task pre...", "zaznamenaj rozhodnutie o...")
- Nemusíš pamätať štruktúru – agent ju pozná z pravidiel načítaných automaticky pri štarte

**Večer / koniec práce:**
```
Update status of completed tasks from today
```

---

**Gratulujeme** – máš nastavený OpenCode Obsidian AI Workspace. Teraz môžeš začať pracovať s AI agentom priamo vo svojom vaulte.
