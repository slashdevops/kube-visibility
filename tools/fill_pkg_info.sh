#!/bin/sh

PKG_PATH="pkg"
MD_FILE="docs/CONTENT.md"

CONTENT="# Package Content Information\n"
CONTENT+="\n"
CONTENT+="The content of this files is auto-generated using the bash script [fill_pkg_info.sh](../tools/fill_pkg_info.sh)\n"
CONTENT+="\n"

# kpt cfg count pkg
CONTENT+="## kpt cfg count \n\n"
CONTENT+="\`\`\`text\n"

PKG_COUNT=$(kpt cfg count $PKG_PATH)
CONTENT+="$PKG_COUNT\n"

CONTENT+="\`\`\`\n\n"

# kpt cfg list-setters pkg
CONTENT+="## kpt cfg list-setters \n\n"
CONTENT+="\`\`\`text\n"

PKG_COUNT=$(kpt cfg list-setters $PKG_PATH)
CONTENT+="$PKG_COUNT\n"

CONTENT+="\`\`\`\n\n"

# kpt cfg tree pkg
CONTENT+="## kpt cfg tree \n\n"
CONTENT+="\`\`\`bash\n"

PKG_COUNT=$(kpt cfg tree $PKG_PATH)
CONTENT+="$PKG_COUNT\n"

CONTENT+="\`\`\`"

echo "$CONTENT" > $MD_FILE