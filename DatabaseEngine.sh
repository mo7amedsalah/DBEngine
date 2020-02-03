#!/bin/bash


select choice in CreateDatabase CreateTable DeleteDB DeleteTable ModifyTable InsertDataIntoTable ViewTable DescribeTable ShowDataBases ShowTables DeleteRecord SelectRecordByID Exit ; do
        case $choice in
        CreateDatabase)
                ./create_Database.sh
                 
                ;;
                

        CreateTable)
                ./create_table.sh
                ;;

        DeleteDB)
                ./delete_Database.sh
                ;;

        \
                DeleteTable)
                ./delete_table.sh
                ;;

        \
                ModifyTable)
                ./modify_table.sh
                ;;

        \
                InsertDataIntoTable)
                ./insert_data.sh
                ;;

        \
                ViewTable)
                ./view_table.sh
                ;;
		DescribeTable)
		./describe_table.sh
		;;
		
 

               ShowDataBases)
                ./show_Database.sh
                ;;
               ShowTables)
                ./show_tables.sh
                ;;

               DeleteRecord)
               ./delete_record.sh
                ;;
               SelectRecordByID)
                ./print_record.sh
                ;;
               Exit)
                   
			exit
                ;;
        *)
                echo "$REPLY is not one of the choices"
                ;;
        esac

done
