
#!/bin/bash
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
            grep "^${myids[$i]}" "$filename"

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
	  read readid
             if [[ "$readid" =~ ^[1-9]+$ ]]
             then
             get_structure_of_table
             get_data_row "$readid"
           
             else
                  echo "invalid value"
           fi
	   
else
echo "your file does not exist"
fi


cd ..
source "DatabaseEngine.sh";
