#!/bin/bash
LC_ALL=C
shopt -s extglob

clear
source "functions"
source "use_Database.sh"


  echo "Enter Table Name you want delete"
  read table_name
  #validate if name of table is true ..
  case $table_name in
  #validate that the name must have not white spaces..

  *\ *)

    echo "Invalid table name!! the name must be without no spaces..!! "
    ;;
    #validate that the name must be letters only..
  +([[:digit:]]))
    echo "-----------------------------------------------------------------------"
    echo "Invalid table name!! the name must be letters and do not have whitespaces!!!!!"
    ;;
    #the valid regix for name..
  +([a-zA-Z]))
    #check if tha table exist...
source /home/sabreensalama/Desktop/bash/project/DBEngine/functions
	file_exist ${table_name}
    if [[ $? -eq 1 ]]; then
      #delete table..

      rm  $table_name
      echo "table deleted"
    else
      echo "-----------------------------------------------------"
      echo "No table with this name"
    fi
    ;;
  *)
    echo "-----------------------------------------------------------------------"
    echo "Invalid table name!! name of table must be lower or upper letters or mix and do not have whitespaces"
    ;;
  esac



cd ..
source "DatabaseEngine.sh";

