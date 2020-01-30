
function file_exist
{
   if test -f "$filename"
   then
   return 1
   else
   return 0
   fi

}
function get_structure_of_table
{
 #must $ not have a space and ifs to separate files
  names=$(sed -n 1p "$filename")
  IFS=':' read -r -a col_names <<< "$names"
  types=$(awk 'NR == 2' "$filename")
  IFS=':' read -r -a  col_types <<< "$types"

}
function get_data_of_table
{
 #must $ not have a space and ifs to separate files
  names=$(awk 'NR>2' "$filename")
  echo "${names}"

  echo "enter the row you want to edit"
  read line
																						    if [[ $line -eq 0 ]]
																				    then
																				    echo "you have no record"
																				    fi 
																				   if [[ "$line" =~ ^[1-9]+$ ]]
																				   then
																				   line=$((line+2))
																				   
																				    edit=$(sed -n "$line p" "$filename")
IFS=":" read -r -a edit_arr <<< "$edit"
length="${#edit_arr[@]}"
for ((i=0;i<length;i++))
 do
 echo "this column data type is ${col_types[$i]} "
 echo "your old value is ${edit_arr[$i]}"
 echo "enter your new value "
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
  printf '%s' "$value:" >>"$filename"
  sed -i "$line d" "$filename"
   else
   echo "not valid"
   fi

  done
  printf "\n"
																				    echo "your record is edit "
																				   elif [[ -z "$line" ]]
																				   then
																				   echo "must not be empty"
																				   elif [[ "$line" =~ ^[a-zA-Z]+$ ]]
																				   then
																				   echo "must be numeric "

																				   else
																				   echo "not valid"
																				   fi
																			  
    
  #| cut -d ':' -f "$i"

 
  
}



echo "enter your file:"
read filename
file_exist

#to check status
result="$?"
if [[ "$result" -eq 1 ]]
then
echo "your file found"
  get_structure_of_table
  get_data_of_table
else
echo "your file does not exist"
fi
