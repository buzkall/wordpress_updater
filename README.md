# Wordpress updater and language cleaner

This script allows you to specify one or several wordpress instalations and update them using wp-cli and also delete the language files you don't want

### Requirements

The sh file must have execution permission

	chmod +x wp_update.sh

The wp-cli library (http://wp-cli.org/) must be installed.
You can install it from brew with

	brew install homebrew/php/wp-cli

In the wp_update.sh file you should specify the path of your installation and the languages you want to keep


### Usage

	cd path_where_you_downloaded_it
	./wp_update.sh

You can create an alias in your .bash_profile or your .bash_aliases

	alias wp_update="source path_where_you_downloaded_it/wp_update.sh"¬


### Results

The script will output something like this

	#############################################
	Updating wp in ~/path_to_site1
	#############################################
	Enabling Maintenance mode...
	Downloading update from https://downloads.wordpress.org/plugin/wp-smushit.zip...
	Unpacking the update...
	Installing the latest version...
	Removing the old version of the plugin...
	Plugin updated successfully.
	Disabling Maintenance mode...
	+------------+-------------+-------------+---------+
	| name       | old_version | new_version | status  |
	+------------+-------------+-------------+---------+
	| wp-smushit | 2.6.1       | 2.6.2       | Updated |
	+------------+-------------+-------------+---------+
	Success: Updated 1 of 1 plugins.
	Success: WordPress is up to date.
	core-default-4.7.3-en_GB-1485573025.zip'...
	Unpacking the update...
	Installing the latest version...
	Translation updated successfully.
	Success: Updated 1/1 translations.
	Updating 'English (UK)' translation for WordPress 4.7.3...
	#############################################
	Looking for lang files in ~/path_to_site1 (keeping en_EN)
	#############################################
	Deleting...  ./wp-content/languages/admin-en_GB.mo
	Deleting...  ./wp-content/languages/admin-network-en_GB.mo
	Deleting...  ./wp-content/languages/en_GB.mo
	Deleting...  ./wp-content/plugins/download-monitor/languages/wp-download_monitor-es_ES.mo
	Deleting...  ./wp-content/plugins/my-link-order/mylinkorder-es_ES.mo
	Deleting...  ./wp-content/plugins/my-page-order/mypageorder-es_ES.mo
	Deleting...  ./wp-content/plugins/nextgen-gallery/products/photocrati_nextgen/modules/i18n/lang/	nggallery-es_ES.mo
	Deleting...  ./wp-content/plugins/quotes-collection/languages/quotes-collection-es_ES.mo
	Deleting...  ./wp-content/plugins/wp-db-backup/wp-db-backup-es_ES.mo
	Deleting...  ./wp-content/plugins/wp-super-cache/languages/wp-super-cache-es_ES.mo
	Deleting... ./wp-content/languages/admin-en_GB.po
	Deleting... ./wp-content/languages/admin-network-en_GB.po
	Deleting... ./wp-content/languages/en_GB.po
	Deleting... ./wp-content/plugins/download-monitor/languages/wp-download_monitor-es_ES.po
	Deleting... ./wp-content/plugins/quotes-collection/languages/quotes-collection-es_ES.po
	Deleting... ./wp-content/plugins/wp-db-backup/wp-db-backup-es_ES.po
	Deleting... ./wp-content/plugins/wp-super-cache/languages/wp-super-cache-es_ES.po

	17 language files deleted
