source "functions"
function get_Data
{
  mydata=$(sed '1,3d' "$filename")
  echo "$mydata"
  echo "enter the line you want to delete"
  read line
    if [[ $line -eq 0 ]]
    then
    echo "you have no record"
    fi 
  if [[ "$line" =~ ^[1-9]+$ ]]
  then
  line=$((line+3))
   #i to remove from source
    awk "NR==$line" "$filename"

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




while true
do
echo "enter your file:"
read filename
file_exist

#to check status
result="$?"
if [[ "$result" -eq 1 ]]
then
echo "your file found"
  get_Data
   break
else
echo "your file does not exist"
fi
done
