source "functions"
function get_Data
{
  mydata=$(sed '1,3d' "$filename")
  echo "$mydata"
  echo "enter the line you want to edit"
  read line
    if [[ $line -eq 0 ]]
    then
    echo "you have no record"
    fi 
  if [[ "$line" =~ ^[1-9]+$ ]]
  then
  line=$((line+3))
   #i to remove from source
    sed -i "$line d" "$filename"
    echo "your record is deleted "
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
else
echo "your file does not exist"
fi
done
