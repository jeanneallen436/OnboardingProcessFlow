#!/bin/bash
# filter-xaml.sh
# Combines HintSize removal and IsExpanded filtering for git diff

sed 's/ sap:VirtualizedContainerService\.HintSize="[0-9.]*,[0-9.]*"//g' "$1" | \
sed '/<x:Boolean x:Key="IsExpanded">\(True\|False\)<\/x:Boolean>/d' | \
sed '/<x:Boolean x:Key="IsPinned">\(True\|False\)<\/x:Boolean>/d'  | \
sed '/<av:Size x:Key="ShapeSize">[0-9.]*,[0-9.]*<\/av:Size>/d' | \
sed $'s/\r$//' | \
tr -d '\r'
# Add this to git config: 
# git config diff.cleandiff.textconv "$(pwd)/clean_diff.sh"

# add to .gitattributes:
#  diff=cleandiff

# to see all diff: git diff --no-textconv
