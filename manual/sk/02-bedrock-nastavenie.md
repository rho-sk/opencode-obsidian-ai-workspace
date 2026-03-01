---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/infrastructure
---
# OpenCode Obsidian AI Workspace – Bedrock Nastavenie

Tento dokument ťa prevedie konfiguráciou Amazon Bedrock ako LLM providera pre OpenCode.

**Predpokladaný čas:** 10-20 minút

**Súvisiace dokumenty:**
- [[01-predpoklady]] – Predpoklady (musí bežať opencode-chat)
- [[03-vault-struktura]] – Nasledujúci krok

---

## Máš už API key od administrátora?

Ak ti firemný administrátor alebo AWS účet už poskytol **API key** pre Amazon Bedrock, preskočí kroky 1-3 a pokračuj priamo na **Krok 4: Konfigurácia API key v OpenCode**.

Ak nie, začni od Kroku 1.

---

## Krok 1: Vytvorenie AWS účtu

1. Prejdi na https://aws.amazon.com
2. Klikni **Create an AWS Account**
3. Vyplň email, heslo, meno účtu
4. Zadaj platobné údaje (kreditná karta – pre overenie, neúčtuje sa pri free tier)
5. Over účet cez telefón alebo SMS
6. Vyber **Basic support** (zadarmo)

**✅ Checkpoint:** Máš prístup do AWS Console

---

## Krok 2: Povolenie Claude modelov v Bedrock

Modely musia byť explicitne povolené v tvojom AWS účte.

1. Prihlás sa do **AWS Console**: https://console.aws.amazon.com
2. V pravom hornom rohu prepni región na **EU (Frankfurt) eu-central-1**
3. Vyhľadaj a otvor **Amazon Bedrock**
4. V ľavom menu klikni **Model access**
5. Klikni **Manage model access**
6. Zaškrtni tieto modely:
   - ✅ **Claude Sonnet 4.6** (`anthropic.claude-sonnet-4-6-20250514-v1:0`)
   - ✅ **Claude Haiku 4.6** (`anthropic.claude-haiku-4-6-20250514-v1:0`)
7. Klikni **Request model access**

> Schválenie prebehne okamžite alebo do niekoľkých minút. Status sa zmení na **Access granted**.

**✅ Checkpoint:** Modely majú status "Access granted"

---

## Krok 3: Získanie API key

1. V AWS Console otvor **IAM** (vyhľadaj "IAM")
2. Ľavé menu: **Users** → **Create user**
3. Meno: `opencode-bedrock` (alebo ľubovoľné), **Next**
4. **Attach policies directly** → vyhľadaj a zaškrtni **`AmazonBedrockFullAccess`** → **Create user**
5. Klikni na nového používateľa → záložka **Security credentials**
6. **Access keys** → **Create access key** → use case: **Application running outside AWS**
7. Skopíruj alebo stiahni:
   - **Access key ID**
   - **Secret access key** (zobrazí sa len raz – ulož ho)

**✅ Checkpoint:** Máš Access key ID a Secret access key

---

## Krok 4: Konfigurácia API key v OpenCode

Spusti interaktívny login:

```bash
opencode auth login
```

OpenCode zobrazí zoznam providerov – vyber **Amazon Bedrock** a zadaj:
- **Access key ID**
- **Secret access key**
- **Región:** `eu-central-1`

OpenCode uloží credentials bezpečne interne – netreba nič editovať manuálne.

**✅ Checkpoint:** `opencode auth login` prebehol bez chýb

---

## Krok 5: Nastavenie default modelu v plugine

V Obsidian: **Settings → OpenCode Chat → Default model**

Odporúčané modely:

| Model ID | Použitie |
|---|---|
| `amazon-bedrock/anthropic.claude-sonnet-4-6-20250514-v1:0` | Hlavný model (komplexné úlohy) |
| `amazon-bedrock/anthropic.claude-haiku-4-6-20250514-v1:0`  | Rýchly model (jednoduché úlohy) |

Nastav **Sonnet** ako default – Haiku môžeš použiť manuálne z dropdown menu v plugine.

**✅ Checkpoint:** Default model je nastavený

---

## Krok 6: Test spojenia

V OpenCode Chat pošli správu:

```
Aký model práve používaš? Povedz mi krátke "hello" v slovenčine.
```

AI by mala odpovedať a uviesť model (napr. `claude-sonnet-4-6`).

**✅ Checkpoint:** Bedrock odpovedá správne

---

## Riešenie problémov

### "Access denied" alebo "UnauthorizedException"

- Over, že modely majú status "Access granted" v Bedrock konzole (región `eu-central-1`)
- Over, že API key má správnu policy (`AmazonBedrockFullAccess`)
- Skús znova `opencode auth login` a zadaj credentials

### "ResourceNotFoundException" pre model

- Skontroluj, že si v správnom regióne (`eu-central-1`)
- Skontroluj, že model je povolený (Bedrock → Model access)

---

## Zhrnutie – Checklist

- ✅ AWS účet vytvorený (alebo API key získaný od administrátora)
- ✅ Región `eu-central-1`
- ✅ Claude modely povolené v Bedrock (Access granted)
- ✅ API key nakonfigurovaný cez `opencode auth login`
- ✅ Default model nastavený v plugin settings
- ✅ Test správy funguje

---

**Ďalší krok:** [[03-vault-struktura]] – Nainštaluj vault guidelines a šablóny
