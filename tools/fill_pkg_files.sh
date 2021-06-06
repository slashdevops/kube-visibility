#!/bin/sh

PKG_PATH="pkg"
MD_FILE="docs/FILES.md"

CONTENT="# Package Content Information\n"
CONTENT+="\n"
CONTENT+="The content of this files is auto-generated using the bash script [fill_pkg_info.sh](../tools/fill_pkg_info.sh)\n"
CONTENT+="\n"

# tree pkg
CONTENT+="## tree \n\n"
CONTENT+="\`\`\`text\n"

PKG_COUNT=$(tree $PKG_PATH)
CONTENT+="$PKG_COUNT\n"

CONTENT+="\`\`\`"

echo "$CONTENT" > $MD_FILE