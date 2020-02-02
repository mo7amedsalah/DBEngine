#!/bin/bash
select choice in CreateDB CreateTable DeleteDB DeleteTables ModifyTable InsertData ViewTable ListDB DeleteRecord
    do
    case $choice in 
    CreateDB )
                 echo "you want to createdb"8;;
      
    CreateTable )
                  echo "you want to create table";;
      
    DeleteDB ) 
                 echo "you want to delete db";;
      

    DeleteTables)
                 echo "you want to delete table";;
     
     
     ModifyTable)
                echo "you want to modify table";;
    
    
     InsertData)
              echo "you want to insert data";;
    

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
