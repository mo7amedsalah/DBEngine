#!/bin/bash
LC_ALL=C
shopt -s extglob

clear
source "functions"
while true; do
	echo "Enter Database Name:"
	read  database_name
	#validate if name of database is true ..
	case $database_name in
	#validate that the name must have not white spaces..

	*\ *)
		echo "-----------------------------------------------------------------------"
		echo "Invalid database name!! the name must be without no spaces..!! "
		;;
		#validate that the name must be letters only..
	+([[:digit:]]))
		echo "-----------------------------------------------------------------------"
		echo "Invalid database name!! the name must be letters and do not have whitespaces!!!!!"
		;;
		#the valid regix for name..
	+([a-zA-Z]))
		#check if tha database created before ...
		check_database_exist "$database_name"
		if [ $? -eq 1 ]; then
			echo "-----------------------------------------------------------------------"
			echo "This database was created before!!!!!!!"


		else
			#create database..
			mkdir $database_name
			echo "-----------------------------------------------------------------------"
			echo "Database created successfully!!!!!!!!!"
                        break

                        

                        
         
		fi

		;;

	*) echo "Invalid database name!! must be alphabetic" ;;
	esac

done
echo $(pwd)
source $(pwd)/DatabaseEngine.sh
