#!/bin/bash
re='^[a-zA-Z]+$'
column_names=()
data_types=()
function check_column_number
{
echo "Enter Number of columns:"
read columnNo 
if [[ $columnNo =~ ^[0-9]+$ ]]
then
   echo "you columns number is $columnNo"
elif [["$columnNo" =~ $re ]]
then
   echo "your column number must be a number"
elif [[ -z $columnNo ]]
then
   echo  "your column number is empty"
else
   echo "invalid number"
fi
 
}
function check_repeat_column
{
  repeated=0
  for key in ${column_names[@]}
  do
     if [["$primary_key" == "$1"]]
     then
        repeated=1
        
     else
         repeated=0

     fi 
  done
  return $repeated
  
}

source "functions"



function primary_key
{
  
  echo "Enter your Primary Key:"
  read primary_key
  repeated= check_repeat_column "$primary_key"
   #if not empty and not repeated
    if test -z "$primary_key"
    then
        echo "your key is empty"
    
    elif [[ $primary_key =~ ^[0-9]+$ ]]
    then
        echo "your key must be alphabatic"
   

    elif (( $repeated == "1" ))
    then
         echo "your key is repeated"
   else
       column_names+=("$primary_key")
       #array[${#column_names[@]}] = "$primary_key"
       echo " your primary key is added "
     fi
 check_data_type 

  
}
function read_column_data
{
    for((i=1;i<columnNo;i++))
    do
    echo "Enter the column name:";
    read column
    if [[ -z "$column" ]]
      then
      echo "your column name must not be empty"
      else
      column_names+=("$column")
     fi
     check_data_type c
    done
}

echo "your table name must be string only"
echo "Enter your table name:"
read filename
if [ -f "$filename" ];
then
echo "you enterd an existed table "
echo "Please enter a valid table "


else
  if [[ "$filename" =~ $re ]]
  then
    echo `touch $filename`
    echo "your table created successfully"
    check_column_number
    primary_key
    read_column_data
    for i in "${column_names[@]}"
    do
       printf '%s' "$i:" >>"$filename"
      #echo $i >> "$filename"
    done
    printf "\n" >>"$filename"
    for i in "${data_types[@]}"
    do
        
       printf '%s' "$i:" >>"$filename"
    done
   #printf "\n">>"$filename"

  elif [ -z "$filename" ]
  then
    echo "your file name is empty"
   else
     echo "your name is invalid"
  fi
fi



export column_names
