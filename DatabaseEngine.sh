#!/bin/bash
select choice in CreateDatabase CreateTable DeleteDB DeleteTable ModifyTable InsertDataIntoTable ViewTable showDB DeleteRecord
    do
    case $choice in 
    CreateDatabase )
                 source /home/salah/bash-Project/DBEngine/create_Database.sh ;;
      
    CreateTable )
                 source /home/salah/bash-Project/DBEngine/create_table.sh ;;
      
    DeleteDB ) 
                 source /home/salah/bash-Project/DBEngine/delete_Database.sh;;
      

    DeleteTable)
                 source /home/salah/bash-Project/DBEngine/delete_table.sh;;
     
     
     ModifyTable)
                source /home/salah/bash-Project/DBEngine/modify_table.sh;;
    
    
     InsertDataIntoTable)
              source /home/salah/bash-Project/DBEngine/insert_data.sh;;
    

     ViewTable)
              echo "you want to view table";;
    
     ListDB)
             echo "you want to list database";;
   
     DeleteRecord)
              echo "you want to delete record";;
     *)
            echo "$REPLY is not one of the choices";;
    esac

    done
