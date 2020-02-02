function file_exist() {
  if test -f "$filename"; then
    return 1
  else
    return 0
  fi

}
function get_structure_of_table() {
  #must $ not have a space and ifs to separate files
  names=$(sed -n 1p "$filename")
  IFS=':' read -r -a col_names <<<"$names"
  types=$(awk 'NR == 2' "$filename")
  IFS=':' read -r -a col_types <<<"$types"

}
function get_data_of_table() {
  #must $ not have a space and ifs to separate files
  names=$(awk 'NR>2' "$filename")
  echo "${names}"

  echo "enter the row you want to edit" 
  read line
  if [[ $line -eq 0 ]]; then
    echo "you have no record"
  fi
  if [[ "$line" =~ ^[1-9]+$ ]]; then
    line=$((line + 2))
    new_arr=()
    edit=$(sed -n "$line p" "$filename")
    IFS=":" read -r -a edit_arr <<<"$edit"
    length="${#edit_arr[@]}"

    for ((j = 0; j < length; j++)); do
      echo "this column data type is ${col_types[$j]} "
      echo "your old value is ${edit_arr[$j]}"
      echo "enter your new value of $j "
      read value
      if [ ${col_types[$j]} = "number" ]; then

        reg="^[0-9]+$"
        if [[ "$value" =~ $reg ]]; then
          echo "you entered a valid value"

          new_arr+=("$value")
          sed -i "$line s/${edit_arr[$j]}/$value/g" "$filename"
          # sed -i "$line d" "$filename"
        # ex -s -c "$line i|${new_arr[$j]}"  -c x "$filename"

        else
          echo "not valid"
        fi

      elif [ ${col_types[$j]} = "string" ]; then
        reg="^[a-zA-Z]+$"
        if [[ "$value" =~ $reg ]]; then
          echo "you entered a valid value"
          new_arr+=("$value")
          sed -i "$line s/${edit_arr[$j]}/$value/g" "$filename"
          #sed -i "$line d" "$filename"
          #ex -s -c "$line i|${new_arr[$j]}"  -c x "$filename"

        else

          echo "not valid"
        fi

      else
        echo "not vaid type"
      fi

    done
    echo "${new_arr[@]}"

    printf "\n"
    echo "your record is edit "
  elif [[ -z "$line" ]]; then
    echo "must not be empty"
  elif [[ "$line" =~ ^[a-zA-Z]+$ ]]; then
    echo "must be numeric "

  else
    echo "not valid"
  fi

  #| cut -d ':' -f "$i"

}

source /home/salah/bash-Project/DBEngine/use_Database.sh
echo "enter your file:"
read filename
file_exist

#to check status
result="$?"
if [[ "$result" -eq 1 ]]; then
  echo "your file found"
  get_structure_of_table
  get_data_of_table
else
  echo "your file does not exist"
fi
cd /home/salah/bash-Project/DBEngine
source /home/salah/bash-Project/DBEngine/DatabaseEngine.sh
