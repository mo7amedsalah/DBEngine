#!/bin/bash
LC_ALL=C
shopt -s extglob
clear
echo "Enter Table Name!!!!!!!!!!!";
IFS= read -r table_name
case $table_name in 
        #validate that the name must have not white spaces..
              
	*\ *)
            echo "-----------------------------------------------------------------------"; 
            echo "Invalid Table name!! the name must be without no spaces..!! "
	  ;;
	#validate that the name must be letters only..
	+([[:digit:]])) 
            echo "-----------------------------------------------------------------------"; 
            echo "Invalid Table name!! the name must be letters and do not have whitespaces!!!!!" 
          ;;
	#the valid regix for name..	
	+([a-zA-Z])) 
	
		#IF table is Exist show the structure...
	   if source check_table_exist.sh; then 
            echo "-----------------------------------------------------------------------";
	    echo "This is The Structure of table $table_name";
            head -2 $table_name;
	   else 
		#IF table is not exist
	      
	      echo "-----------------------------------------------------------------------";	
	      echo "The table is not exist";
	   fi
	  ;;

	*) echo "Invalid Table name!! name of Table must be lower or upper letters or mix and do not have whitespaces!!!! "
esac

