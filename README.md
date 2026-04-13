# Raycast Mac Automation

Built in one day as part of my developer/data analyst journey.

> A macOS automation system triggered by global hotkeys — no clicking, no context switching, pure flow state.

---

## What This Does

A macOS automation system built with Raycast that:
- Captures clipboard text and saves it **simultaneously** to Notion (via API) and a local `clips.txt` file on the Desktop
- Triggered by a global hotkey (`Cmd+Shift+N`) from anywhere on the Mac — browser, terminal, Claude, anywhere
- Includes a 41-snippet library for data analysis and AI prompting

---

## Hotkeys

| Hotkey | Action |
|---|---|
| `Cmd+Shift+N` | Clip selected text → saves to Notion + Desktop simultaneously |
| `Cmd+Space` | Open Raycast launcher |
| `Cmd+Ctrl+Shift+4` | Screenshot to clipboard instantly |

---

## Files

- `notion-clipper.sh` — Bash/Python script that calls the Notion API and appends to `~/Desktop/clips.txt`
- `raycast-snippets-v3.json` — 41 custom Raycast snippets for data analysis and Claude prompts

---

## Snippet Library

41 snippets across two categories:

**Data Analysis (20)** — code shortcuts for pandas, matplotlib, seaborn, sklearn
- `;imp` → full import block
- `;head` → df.head() + shape + info + describe
- `;null` → isnull().sum()
- `;gb` → groupby template
- and 16 more...

**Claude Prompts (20)** — plain English prompt starters
- `;eli5` → Explain this to me like I'm 5 years old:
- `;bug` → Find the bug in this code and explain it simply:
- `;stuck` → I'm stuck. Walk me through this step by step:
- `;diff` → What's the difference between:
- and 16 more...

---

## Tech Used

- Bash + Python
- Notion API (REST — HTTP PATCH requests)
- Raycast Script Commands
- macOS clipboard (`pbpaste`)

---

## What I Learned

- How REST APIs work (HTTP requests, authentication tokens, JSON payloads)
- Bash scripting and Python subprocess handling
- Debugging JSON encoding issues with special characters
- Connecting local Mac automation to cloud services
- How API tokens authenticate without browser login
- Global hotkey architecture on macOS

---

## Built By

DimmMak — built in one session as part of an ongoing data analyst + developer journey.
