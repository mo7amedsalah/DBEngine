#!/bin/bash
#filename is a global variable
# <<< to pass a string
clear
data=()
source "functions";
source $(pwd)/use_Database.sh;


#filename is a global variable
# <<< to pass a string
data=()


# erroe regex / is accepted
function insert_check_primary
{
while true
do 
   echo "this column data type is ${col_types[0]} "
   echo "enter the primary value"
   read pvalue

    if [[ -z $pvalue ]]
     then
     echo "must not be empty"
     echo "try again"
     echo "--------------------------------------"
     elif [[ $pvalue =~ ^[a-zA-Z]+$ ]]
    then
          echo "must be a number"
    elif [[ $pvalue == 0 ]]
    then
        echo "not accepted"
    else
    check_pk "$pvalue"

   repeat="$?"
    if [ "$repeat" -eq 1 ]
    then
          echo "repeated"
          echo "try again"
    elif [  ! "$repeat" -eq 1 ]
     then
          echo "not repeated data"
          data+=("$pvalue")
          break
     else
       echo "invalid"
    fi
    fi
    
done  
}


function insert_data
{

	 reg=""
	 insert_check_primary

	  echo "${#col_names[@]}"
	 length=${#col_names[@]}
	  for ((i=1;i<length;i++))
	  do
                 while true
		 do		
	        echo "this column data type is ${col_types[$i]} "
	        echo "enter the $ $i data"
	        read value
	        if [ ${col_types[$i]} = "number" ]
	        then

		   reg="^[0-9]+$"

	         elif [ ${col_types[$i]} = "string" ]
		 then
		    reg="^[a-zA-Z]+$"
		 else
		   echo "not vaid type"
	         fi

	         if [[ "$value" =~ $reg ]]
	         then
                   data+=("$value")
	           echo "your data saved successfully"
	           
                   break

	        else
	        echo "not valid"
	        fi
          done
	  
	  done

}

while true
do
	echo "Enter Your Table Name:"
	read filename

	if [[ -f "$filename" ]]
	then

		get_structure_of_table
		insert_data
                echo "------------------------------------------"
                for i in "${col_names[@]}"; do
			printf '%s' "$i    |" 
	        done
                  printf "\n"
             	  printf "\n" >>"$filename"
                   get_All_Data

		for value in "${data[@]}"
		  do
		      printf '%s' "$value:" >>"$filename"
                     printf '%s' "$value:"
		  done
                   printf "\n"

                   echo "------------------------------------------"
		   break

	 elif [[ -z "$filename" ]]
	 then
		     echo "you  must enter table name"
	else
	     echo "this name is not valid or file is existed"
	fi

done
cd ..
source "DatabaseEngine.sh";
