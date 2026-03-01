---
created: '2026-03-01'
tags:
  - type/reference
  - project/opencode-obsidian-ai-workspace
  - topic/documentation
  - topic/installation
---
# OpenCode Obsidian AI Workspace – Prerequisites

Before setting up this workspace, you need a working **OpenCode Chat** plugin.

**Related docs:**
- [[00-introduction]] – Introduction and overview
- [[02-bedrock-setup]] – Next step

---

## What must be running before this setup

| Prerequisite | Where to set up |
|---|---|
| Obsidian desktop installed | https://obsidian.md |
| Node.js 20+ installed | [[../../opencode-chat/manual/en/01-installation\|opencode-chat Step 1]] |
| OpenCode installed (`opencode --version`) | [[../../opencode-chat/manual/en/01-installation\|opencode-chat Step 2]] |
| MCP configured (`mcp-obsidian`) | [[../../opencode-chat/manual/en/01-installation\|opencode-chat Step 4]] |
| OpenCode server running (port 4096) | [[../../opencode-chat/manual/en/01-installation\|opencode-chat Step 5]] |
| OpenCode Chat plugin installed & enabled | [[../../opencode-chat/manual/en/01-installation\|opencode-chat Step 6-7]] |

If any prerequisite is missing, go first to: **[[../../opencode-chat/manual/en/01-installation|OpenCode Chat – Installation]]**

---

## Verify everything works before continuing

### 1. OpenCode server

```bash
curl http://localhost:4096/global/health
# {"healthy":true,"version":"1.x.x"}
```

If it doesn't return `healthy: true`, restart the service:

```bash
systemctl --user restart opencode-web   # Linux
launchctl restart com.opencode.web      # macOS
```

### 2. MCP – vault access

In the OpenCode Chat plugin, send a message:

```
List the contents of the root vault directory
```

The AI should display a list of folders and files in your vault.

If the AI can't see the vault, check your MCP config in `~/.config/opencode/config.json`:

```json
{
  "mcp": {
    "obsidian": {
      "type": "local",
      "command": [
        "npx", "-y",
        "@mauricio.wolff/mcp-obsidian@latest",
        "/PATH/TO/YOUR/VAULT"
      ]
    }
  }
}
```

### 3. Plugin connection

In Obsidian: **Settings → OpenCode Chat → Test connection**

Must show: `Connected! OpenCode v1.x.x`

---

## AWS requirements (for Bedrock)

For Amazon Bedrock you will need:

- ✅ **AWS account** – https://aws.amazon.com (free to create)
- ✅ **IAM user or role** with Bedrock permissions
- ✅ **Model access enabled** in the AWS Bedrock console (Claude models)
- ✅ **Region** `eu-central-1` (recommended – GDPR)

Detailed steps: **[[02-bedrock-setup]]**

---

## Summary – checklist

Before proceeding to [[02-bedrock-setup]], verify:

- ✅ `curl http://localhost:4096/global/health` returns `healthy: true`
- ✅ OpenCode Chat plugin is enabled in Obsidian
- ✅ Test connection in plugin settings = Connected
- ✅ AI can see vault files via MCP
- ✅ You have an AWS account (or are about to create one)

---

**Next step:** [[02-bedrock-setup]] – Configure Amazon Bedrock
