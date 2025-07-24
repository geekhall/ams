############################
# File Name: convert.sh
# Author: GeekHour
# mail: geekhour.net@gmail.com
# Created Time: 三  7/23 10:47:07 2025
############################
#!/bin/bash
find ./src -type f -name "*.java" | while read file; do
  encoding=$(file -bi "$file" | awk -F "=" '{print $2}')
  if [ "$encoding" != "utf-8" ]; then
    echo "Converting: $file from $encoding to UTF-8"
    iconv -f "$encoding" -t utf-8 "$file" > "$file.tmp" && mv "$file.tmp" "$file"
  fi
done

