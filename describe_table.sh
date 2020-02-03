#!/bin/bash
LC_ALL=C
shopt -s extglob
clear
source $(pwd)/use_Database.sh
while true; do
	echo "Enter Table Name!!!!!!!!!!!"
	IFS= read -r table_name
	case $table_name in
	#validate that the name must have not white spaces..

	*\ *)
		echo "-----------------------------------------------------------------------"
		echo "Invalid Table name!! the name must be without no spaces..!! "
		;;
		#validate that the name must be letters only..
	+([[:digit:]]))
		echo "-----------------------------------------------------------------------"
		echo "Invalid Table name!! the name must be letters and do not have whitespaces!!!!!"
		;;
		#the valid regix for name..
	+([a-zA-Z]))

		#IF table is Exist show the structure...
		file_exist
		if [ $? -eq 1 ]; then
			echo "-----------------------------------------------------------------------"
			echo "This is The Structure of $table_name"
			echo "-----------------------------------------------------------------------"
			awk 'NR == 2 { print }' $table_name
			echo "-----------------------------------------------------------------------"
			awk 'NR == 3 { print }' $table_name
			echo "-----------------------------------------------------------------------"

			break
		else
			#IF table is not exist

			echo "-----------------------------------------------------------------------"
			echo "The table is not exist"
			source $(pwd)/DatabaseEngine.sh
		fi
		;;

	*) echo "Invalid Table name!! name of Table must be lower or upper letters or mix and do not have whitespaces!!!! " ;;
	esac
done

source $(pwd)/DatabaseEngine.sh
