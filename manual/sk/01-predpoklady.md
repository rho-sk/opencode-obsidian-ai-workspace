---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/installation
---
# OpenCode Obsidian AI Workspace – Predpoklady

Pred nastavením tohto workspace musíš mať funkčný **OpenCode Chat** plugin.

**Súvisiace dokumenty:**
- [[00-uvod]] – Úvod a prehľad
- [[02-bedrock-nastavenie]] – Bedrock konfigurácia

---

## Čo musí bežať pred týmto setupom

| Predpoklad | Stav | Kde nastaviť |
|---|---|---|
| Obsidian desktop | nainštalovaný | https://obsidian.md |
| Node.js 20+ | nainštalovaný | [[../../opencode-chat/manual/sk/01-instalacia\|opencode-chat Krok 1]] |
| OpenCode (`opencode --version`) | nainštalovaný | [[../../opencode-chat/manual/sk/01-instalacia\|opencode-chat Krok 2]] |
| MCP konfigurácia (`mcp-obsidian`) | nakonfigurovaná | [[../../opencode-chat/manual/sk/01-instalacia\|opencode-chat Krok 4]] |
| OpenCode server beží (port 4096) | beží | [[../../opencode-chat/manual/sk/01-instalacia\|opencode-chat Krok 5]] |
| OpenCode Chat plugin | nainštalovaný a zapnutý | [[../../opencode-chat/manual/sk/01-instalacia\|opencode-chat Krok 6-7]] |

Ak niektorý predpoklad chýba, prejdi najprv na: **[[../../opencode-chat/manual/sk/01-instalacia|OpenCode Chat – Inštalácia]]**

---

## Overiť funkčnosť pred pokračovaním

### 1. OpenCode server

```bash
curl http://localhost:4096/global/health
# {"healthy":true,"version":"1.x.x"}
```

Ak nevráti `healthy: true`, reštartuj službu:

```bash
systemctl --user restart opencode-web   # Linux
launchctl restart com.opencode.web      # macOS
```

### 2. MCP – prístup k vaultu

V OpenCode Chat plugine pošli správu:

```
Vypíš obsah koreňového adresára vaultu
```

AI by mala zobraziť zoznam priečinkov a súborov vo vaulte.

Ak AI nevidí vault, over MCP konfiguráciu v `~/.config/opencode/config.json`:

```json
{
  "mcp": {
    "obsidian": {
      "type": "local",
      "command": [
        "npx", "-y",
        "@mauricio.wolff/mcp-obsidian@latest",
        "/CESTA/K/VAULTU"
      ]
    }
  }
}
```

### 3. Plugin pripojenie

V Obsidian: **Settings → OpenCode Chat → Test connection**

Musí zobraziť: `Connected! OpenCode v1.x.x`

---

## AWS požiadavky (pre Bedrock)

Pre Amazon Bedrock budeš potrebovať:

- ✅ **AWS účet** – https://aws.amazon.com (vytvorenie zadarmo)
- ✅ **IAM používateľ alebo role** s oprávneniami pre Bedrock
- ✅ **Povolený prístup k modelom** v AWS Bedrock konzole (Claude modely)
- ✅ **Región** `eu-central-1` (odporúčané – GDPR)

Detailný postup: **[[02-bedrock-nastavenie]]**

---

## Zhrnutie – checklist

Pred pokračovaním na [[02-bedrock-nastavenie]] over:

- ✅ `curl http://localhost:4096/global/health` vracia `healthy: true`
- ✅ OpenCode Chat plugin je zapnutý v Obsidian
- ✅ Test connection v plugin settings = Connected
- ✅ AI vidí vault súbory cez MCP
- ✅ Máš AWS účet (alebo ho ideš vytvoriť)

---

**Ďalší krok:** [[02-bedrock-nastavenie]] – Konfigurácia Amazon Bedrock
