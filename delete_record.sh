
#!/bin/bash
clear
source "functions"

source $(pwd)/use_Database.sh

function get_data_row
{
         	  #ids=$(awk -F":" 'NR>3 {print '$'$pk}' "$filename" | cut -f $pk )
	  ids=$(awk -F":" 'NR>3 {print '$'$pk}' "$filename" | cut -d":" -f $pk | tr '\n' ' ')
	    read -r -a myids <<< "$ids"
	   
	   length="${#myids[@]}" 

	flage=0   
	  for ((i=0;i<length;i++)) 
	  do

	     if [[ ${myids[$i]} == $1 ]]
	     then
                flage=1
                 break
           else

                   flage=0
            fi
	  done
     if [[ "$flage" -eq 1 ]]
      then
            #grep "^${myids[$i]}" "$filename"
           grep -v "^${myids[$i]}" "$filename" > temp && mv temp "$filename"
           echo "your ${myids[$i]} deleted successfully "

      else
         echo "not found"
      fi

}

echo "enter your file:"
read filename


if [[ -f "$filename" ]]
then

	  echo "your file found"
	  echo "enter the id :"
	  read readline
             if [[ "$readline" =~ ^[1-9]+$ ]]
             then
     
             get_structure_of_table
             get_data_row "$readline"


           
             else
                  echo "invalid value"
           fi
	   
else
echo "your file does not exist"
fi

cd ..
source "DatabaseEngine.sh";
