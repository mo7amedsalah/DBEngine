#!/bin/bash
#filename is a global variable
# <<< to pass a string
data=()
function get_structure_of_table
{
 #must $ not have a space and ifs to separate files
  names=$(sed -n 1p "$filename")
  IFS=':' read -r -a col_names <<< "$names"
  types=$(awk 'NR == 2' "$filename")
  IFS=':' read -r -a  col_types <<< "$types"

}
function file_exist
{
   if test -f "$filename"
   then
   return 1
   else
   return 0
   fi

}

function insert_check_primary
{
   echo "this column data type is ${col_types[0]} "
   echo "enter the primary value"
   read pvalue
   #with no space +
   data+=("$pvalue")

}

function insert_data
{
 reg=""
 insert_check_primary
 echo "${#col_names[@]}"
 length=${#col_names[@]}
  for ((i=1;i<length;i++))
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
   echo "you entered a valid value"
   data+=("$value")
   else
   echo "not valid"
   fi
  
  done
  echo "${data[@]}"
}

#source "create_file" "${column_name[@]}"
#. ./create_table.sh
#echo "${column_name[@]}"


echo "enter your file:"
read filename
file_exist
#to check status
result="$?"
if [[ "$result" -eq 1 ]]
then
echo "your file found"
get_structure_of_table
insert_data

for value in "${data[@]}"
  do
  printf '%s' "$value:" >>"$filename"
  done
 printf "\n" >>"$filename"
elif [[ -z "$filename" ]]
then
echo "your must enter table name"
else
echo "this name is not valid"
fi




