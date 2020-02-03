
#!/bin/bash
source "functions"

source $(pwd)/use_Database.sh
function get_Data
{
while true
do
  mydata=$(sed '1,3d' "$filename")
  echo "$mydata"
  echo "enter the line you want to show"
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
    echo "-----------------------------------"
   break

  elif [[ -z "$line" ]]
  then
  echo "must not be empty"
  elif [[ "$line" =~ ^[a-zA-Z]+$ ]]
  then
  echo "must be numeric "

 else
  echo "not valid"
 fi
  done
}




while true
do
echo "enter your file:"
read filename
file_exist ${filename}

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

cd ..
source "DatabaseEngine.sh";
