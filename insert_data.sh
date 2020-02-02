#!/bin/bash
#filename is a global variable
# <<< to pass a string
data=()
source "functions"


function check_pk
{

	  ids=$(awk -F":" 'NR>3 {print $pk}' "$filename" | cut -d":" -f$pk | tr '\n' ' ')
	     echo "$ids"
	    read -r -a myids <<< "$ids"
	    echo "myids is ${myids[@]}"
	   
	   length="${#myids[@]}" 
	  flag=0
	   
	  for ((i=0;i<length;i++)) 
	  do

	     if [[ ${myids[$i]} == $1 ]]
	     then
		flag=1
		break;

		
	     else
		 flag=0

	     fi 
	  done
	  return $flag
	 

}


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
     elif [[ $pvalue =~ ^[a-zA-Z]+$ ]]
    then
          echo "must be a number"
   
    else
    check_pk "$pvalue"

   repeat="$?"
    if [ "$repeat" -eq 1 ]
    then
          echo "repeated"
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
	        echo "enter the $i data"
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
	echo "Enter Your File Name:"
	read filename
	file_exist
	#to check status
	result="$?"
	if [[ "$result" -eq 1 ]]
	then

	get_structure_of_table
	insert_data

	for value in "${data[@]}"
	  do
	      printf '%s' "$value:" >>"$filename"
	  done
	      printf "\n" >>"$filename"
              break

	elif [[ -z "$filename" ]]
	 then
	     echo "you  must enter table name"
	else
	     echo "this name is not valid or file is existed"
	fi

done
cd /home/salah/bash-Project/DBEngine;
./ DatabaseEngine.sh
