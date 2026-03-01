---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/infrastructure
---
# OpenCode Obsidian AI Workspace – Bedrock Setup

This guide walks you through configuring Amazon Bedrock as the LLM provider for OpenCode.

**Estimated time:** 10-20 minutes

**Related docs:**
- [[01-prerequisites]] – Prerequisites (opencode-chat must be running)
- [[03-vault-structure]] – Next step

---

## Already have an API key from your administrator?

If your company administrator or AWS account has already provided you with an **API key** for Amazon Bedrock, skip steps 1-3 and go directly to **Step 4: Configure API key in OpenCode**.

Otherwise, start from Step 1.

---

## Step 1: Create an AWS account

1. Go to https://aws.amazon.com
2. Click **Create an AWS Account**
3. Fill in email, password, account name
4. Enter payment details (credit card – for verification; not charged under free tier)
5. Verify via phone call or SMS
6. Choose **Basic support** (free)

**✅ Checkpoint:** You have access to the AWS Console

---

## Step 2: Enable Claude models in Bedrock

Models must be explicitly enabled in your AWS account.

1. Sign in to **AWS Console**: https://console.aws.amazon.com
2. In the top-right corner, switch region to **EU (Frankfurt) eu-central-1**
3. Search for and open **Amazon Bedrock**
4. In the left menu, click **Model access**
5. Click **Manage model access**
6. Check these models:
   - ✅ **Claude Sonnet 4.6** (`anthropic.claude-sonnet-4-6-20250514-v1:0`)
   - ✅ **Claude Haiku 4.6** (`anthropic.claude-haiku-4-6-20250514-v1:0`)
7. Click **Request model access**

> Approval is instant or takes a few minutes. Status changes to **Access granted**.

**✅ Checkpoint:** Models show status "Access granted"

---

## Step 3: Get an API key

1. In AWS Console, open **IAM** (search "IAM")
2. Left menu: **Users** → **Create user**
3. Name: `opencode-bedrock` (or any name you prefer), **Next**
4. **Attach policies directly** → search for and check **`AmazonBedrockFullAccess`** → **Create user**
5. Click on the new user → tab **Security credentials**
6. **Access keys** → **Create access key** → use case: **Application running outside AWS**
7. Copy or download:
   - **Access key ID**
   - **Secret access key** (shown only once – save it)

**✅ Checkpoint:** You have the Access key ID and Secret access key

---

## Step 4: Configure API key in OpenCode

Run the interactive login:

```bash
opencode auth login
```

OpenCode shows a list of providers – select **Amazon Bedrock** and enter:
- **Access key ID**
- **Secret access key**
- **Region:** `eu-central-1`

OpenCode stores credentials securely internally – no manual file editing needed.

**✅ Checkpoint:** `opencode auth login` completed without errors

---

## Step 5: Set the default model in the plugin

In Obsidian: **Settings → OpenCode Chat → Default model**

Recommended models:

| Model ID | Use |
|---|---|
| `amazon-bedrock/anthropic.claude-sonnet-4-6-20250514-v1:0` | Main model (complex tasks) |
| `amazon-bedrock/anthropic.claude-haiku-4-6-20250514-v1:0`  | Fast model (simple tasks) |

Set **Sonnet** as default – you can use Haiku manually from the plugin dropdown.

**✅ Checkpoint:** Default model is set

---

## Step 6: Test the connection

In OpenCode Chat, send a message:

```
What model are you using? Say a short "hello" in English.
```

The AI should respond and mention the model (e.g. `claude-sonnet-4-6`).

**✅ Checkpoint:** Bedrock responds correctly

---

## Troubleshooting

### "Access denied" or "UnauthorizedException"

- Verify models have status "Access granted" in the Bedrock console (region `eu-central-1`)
- Verify the API key has the correct policy (`AmazonBedrockFullAccess`)
- Try `opencode auth login` again and re-enter credentials

### "ResourceNotFoundException" for model

- Check you're using the correct region (`eu-central-1`)
- Check the model is enabled (Bedrock → Model access)

---

## Checklist

- ✅ AWS account created (or API key obtained from administrator)
- ✅ Region `eu-central-1`
- ✅ Claude models enabled in Bedrock (Access granted)
- ✅ API key configured via `opencode auth login`
- ✅ Default model set in plugin settings
- ✅ Test message works

---

**Next step:** [[03-vault-structure]] – Install vault guidelines and templates
