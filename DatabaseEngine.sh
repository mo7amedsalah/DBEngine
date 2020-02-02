#!/bin/bash
select choice in CreateDatabase CreateTable DeleteDB DeleteTable ModifyTable InsertDataIntoTable ViewTable DescribeTable ShowDataBase ShowTables DeleteRecord DeleteRecordByID Exit
    do
    case $choice in 
    CreateDatabase )
                 source /home/salah/bash-Project/DBEngine/create_Database.sh ;;
   # UseDataBase )
	#	source 	/home/salah/bash-Project/DBEngine/use_Database.sh ;;
      
    CreateTable )
                 source /home/salah/bash-Project/DBEngine/create_table.sh ;;
      
    DeleteDB ) 
                 source /home/salah/bash-Project/DBEngine/delete_Database.sh;;
      

    DeleteTable)
                 source /home/salah/bash-Project/DBEngine/delete_table.sh;;
     
     
     ModifyTable)
                source /home/salah/bash-Project/DBEngine/modify_table.sh;;
    
    
     InsertDataIntoTable )
              source /home/salah/bash-Project/DBEngine/insert_data.sh;;
    

     ViewTable )
              source /home/salah/bash-Project/DBEngine/view_table.sh;;
     DescribeTable )
	      source /home/salah/bash-Project/DBEngine/describe_table.sh ;;		
    
     ShowDataBase )
             source /home/salah/bash-Project/DBEngine/show_Database.sh;;
     ShowTables )
             source /home/salah/bash-Project/DBEngine/show_tables.sh;;
   
     DeleteRecord )
              source /home/salah/bash-Project/DBEngine/delete_record.sh;;
     DeleteRecordByID )
		echo "Delete By Id" ;;
     Exit ) 
		exit ;;
     *)
            echo "$REPLY is not one of the choices";;
    esac

    done
