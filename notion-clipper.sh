#!/bin/bash
# @raycast.schemaVersion 1
# @raycast.title Notion Clipper
# @raycast.mode silent
# @raycast.icon 📋

SELECTED_TEXT=$(pbpaste)

if [ -z "$SELECTED_TEXT" ]; then
  osascript -e 'display notification "No text in clipboard!" with title "Notion Clipper"'
  exit 1
fi

# Save to local file on Desktop
TIMESTAMP=$(date "+%B %d, %Y %H:%M")
echo "[$TIMESTAMP]" >> ~/Desktop/clips.txt
echo "$SELECTED_TEXT" >> ~/Desktop/clips.txt
echo "---" >> ~/Desktop/clips.txt

# Save to Notion
python3 << PYTHON
import json, urllib.request, subprocess
from datetime import datetime
text = subprocess.check_output(['pbpaste']).decode('utf-8')
timestamp = datetime.now().strftime("%B %d, %Y %H:%M")
data = {
    "children": [
        {"object":"block","type":"quote","quote":{"rich_text":[{"type":"text","text":{"content":text}}]}},
        {"object":"block","type":"paragraph","paragraph":{"rich_text":[{"type":"text","text":{"content":f"Clipped on {timestamp}"},"annotations":{"color":"gray","italic":True}}]}},
        {"object":"block","type":"divider","divider":{}}
    ]
}
req = urllib.request.Request(
    "https://api.notion.com/v1/blocks/341b5749504180569af0fff1f2cf4f0f/children",
    data=json.dumps(data).encode(),
    headers={"Authorization":"Bearer YOUR_NOTION_TOKEN_HERE","Content-Type":"application/json","Notion-Version":"2022-06-28"},
    method="PATCH"
)
urllib.request.urlopen(req)
PYTHON

osascript -e 'display notification "Saved to Notion + Desktop ✅" with title "Notion Clipper"'
