#!/bin/bash

# first look for a wp install
if [ ! $1 ]; then
	echo "Specify path as first parameter"
fi
if [ ! -d "$1" ]; then
	echo "Specify wp path as first parameter. The one you've set, doesn't exist"
	exit 1
fi

if [ $(find $1 -depth 1 -type d -name 'wp-content' | wc -c) = 0 ]; then
	echo 'wp no encontrado'
	exit 1
fi

if [ ! $2 ]; then
	echo "specify which language you want to keep [ie: es_ES]"
	exit 1
fi

echo "#############################################"
echo "   Looking for lang files in $1 (keeping $2)"
echo "#############################################"
# exclude es files
count=0
keep_lang=$2
keep_lang_upper=$(echo "$keep_lang" | awk '{print toupper($0)}')
keep_lang_extended="${keep_lang}_${keep_lang_upper}"

#find $1 \( -name "*_*.mo" ! -iname "*$2.mo" \) -print | while read f; do
while read f; do
	let count=count+1
	echo "Deleting... " $f
	rm $f
done <<< "$(find $1 \( -iregex "*[-_]*.mo" ! -iname "*${keep_lang}.mo" ! -iname "*${keep_lang_extended}.mo" \) -print)"

#find $1 \( -name "*_*.po" ! -iname "*$2.po" \) -print | while read f; do
while read f; do
	let count=count+1
	echo "Deleting..." $f
        rm $f
done <<< "$(find $1 \( -iregex "*[-_]*.po" ! -iname "*${keep_lang}.po" ! -iname "*${keep_lang_extended}.mo" \) -print)"

echo $count "language files deleted"
