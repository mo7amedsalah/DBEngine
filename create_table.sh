#!/bin/bash
clear
re='^[a-zA-Z]+$'
column_names=()
data_types=()

source $(pwd)/functions
source $(pwd)/use_Database.sh

function check_column_number() {
	while true; do
		echo "Enter Number of columns:"
		read columnNo
		if [[ $columnNo =~ ^[1-9]+$ ]]; then
			echo "you columns number is $columnNo"
			break
		elif [[ "$columnNo" =~ $re ]]; then
			echo "your column number must be a number"
		elif [[ -z $columnNo ]]; then
			echo "your column number must not be  empty"
		else
			echo "invalid number"
		fi
	done

}
function check_index_primary_key() {

	while true; do
		echo "Enter location of primary key "
		read pk_index
          
                 
		if [[ $pk_index =~ ^[1-9]+$ ]]; then
			echo "$pk_index" >>"$filename"
			break
		elif [[ -z $pk_index ]]; then
			echo "your column number is empty"
		else
			echo "invalid "
		fi
	done

}
function primary_key() {
	check_index_primary_key
	while true; do
		echo "Enter your  column name :"
		read primary_key

		#if not empty and not repeated

		if test -z "$primary_key"; then
			echo "your key is empty"

		elif [[ $primary_key =~ ^[0-9]+$ ]]; then
			echo "your key must be alphabatic"

		else

			column_names+=("$primary_key")
			#array[${#column_names[@]}] = "$primary_key"
			break
		fi
	done
	check_data_type

}

function read_column_data() {
	for ((i = 1; i < columnNo; i++)); do
		echo "Enter the $i column name:"
		read column
		while true; do
			if [[ -z "$column" ]]; then
				echo "your column name must not be empty"
                        elif [[ $primary_key =~ ^[0-9]+$ ]]; then
			echo "your key must be alphabatic"
                        elif [[ $primary_key =~ ^[a-zA-Z-9]+$ ]]; then
			echo "your key is valid"
			else
				check_data_type
				column_names+=("$column")

				break

			fi

		done
	done

}

function print_names() {
	for i in "${column_names[@]}"; do
		printf '%s' "$i:" >>"$filename"
                printf '%s' "$i      |" 


	done
	printf "\n" >>"$filename"

}
function print_data_types() {

	for i in "${data_types[@]}"; do

		printf '%s' "$i:" >>"$filename"



	done

}


echo "your table name must be string only"
echo "------------------------------------"
while true; do
	echo "Enter your table name:"
	read filename
	
	if [ -f "$filename" ]; then
		echo "you enterd an existed table "
		echo "try again !!"
	elif [[ "$filename" =~ $re ]]; then

		echo $(touch $filename)
		check_column_number
		primary_key
		read_column_data
		print_names
		print_data_types
                 printf "\n"
		echo "your meta data saved successfully to $filename"
		echo "------------------------------------------------"
		break
          elif [ -z "$filename" ]; then
		echo "your file name is empty"
	else
		echo "invalid"

	fi

done
cd ..
source "DatabaseEngine.sh"
