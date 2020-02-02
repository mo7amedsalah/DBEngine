


#!/bin/bash
LC_ALL=C
shopt -s extglob

clear 
source /home/salah/bash-Project/DBEngine/use_Database.sh ;
while true
do
echo "Enter Table Name you want delete!!!!!!!!!!!";
read table_name;
#validate if name of table is true ..
case $table_name in 
        #validate that the name must have not white spaces..
              
	*\ *)
            echo "-----------------------------------------------------------------------"; 
            echo "Invalid table name!! the name must be without no spaces..!! "
	  ;;
	#validate that the name must be letters only..
	+([[:digit:]])) 
            echo "-----------------------------------------------------------------------"; 
            echo "Invalid table name!! the name must be letters and do not have whitespaces!!!!!" 
          ;;
	#the valid regix for name..	
	+([a-zA-Z])) 
		#check if tha table exist...
	     source /home/salah/bash-Project/DBEngine/check_table_exist.sh ${table_name}
	      if [ $? -eq 0 ]
		then
                 #delete table..
                 rm -R $table_name;
                 echo "-----------------------------------------------------------------------"; 
	         echo "table deleted!!!!!!!!!"
		  source /home/salah/bash-Project/DBEngine/DatabaseEngine.sh		
             else
                 echo "-----------------------------------------------------------------------"; 
                 echo "No table with this name!!!!!!!!!!"
             fi
                                                                                    ;;   
	*)
                 echo "-----------------------------------------------------------------------"; 
                 echo "Invalid table name!! name of table must be lower or upper letters or mix and do not have whitespaces!!!! "
esac
done
source /home/salah/bash-Project/DBEngine/DatabaseEngine.sh
