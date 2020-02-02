
function get_Data
{
  echo "The table before deleting!!!!!!!!!!!!!!"
  mydata=$(sed '1,2d' "$filename")
  echo "$mydata"
  echo "enter the line you want to delete!!!!!!!!!!!"
  read line
    if [[ $line -eq 0 ]]
    then
    echo "you have no record"
    fi 
  if [[ "$line" =~ ^[1-9]+$ ]]
  then
  line=$((line+2))
   #i to remove from source
    sed -i "$line d" "$filename"
    echo "your record is deleted!!!!!!!!!!!!!"
    echo "the table after deleting!!!!!!!!!!!!"
    mydata=$(sed '1,2d' "$filename")
    echo "$mydata"
  elif [[ -z "$line" ]]
  then
  echo "must not be empty"
  elif [[ "$line" =~ ^[a-zA-Z]+$ ]]
  then
  echo "must be numeric "

 else
  echo "not valid"
 fi
  
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



echo "enter your file:"
read filename
file_exist

#to check status
result="$?"
if [[ "$result" -eq 1 ]]
then
echo "your file found"
  get_Data
else
echo "your file does not exist"
fi
