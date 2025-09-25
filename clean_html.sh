#!/bin/bash
echo Cleaning HTML

sed -i '' 's/<title>README<\/title>/<title>2025 State of Scholarly Publishing<\/title>/g' index.html

GA_SCRIPT=$(cat ga_snippet.html | sed 's/[\/&]/\\&/g')
HLN=$(awk "/<\/head>/ {print FNR}" index.html)
head -n $((--HLN)) index.html > new.html
cat  ga_snippet.html >> new.html
tail -n +$((++HLN)) index.html >> new.html
mv new.html index.html
