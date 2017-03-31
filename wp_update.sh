#!/bin/bash

wp_dirs=(~/path_to_site1
~/path_to_site2
)

wp_languages=(es_ES
en_GB
)

key=0
for i in ${wp_dirs[@]}; do
	cd $i
	echo "#############################################"
	echo "   Updating wp in $(pwd)"
	echo "#############################################"
	wp plugin update --all;
	wp core update;
	wp core language update;
	~/Sites/_scripts/delete_lang_files.sh . ${wp_languages[$key]}
	key=$((key+1))
done

cd ~

