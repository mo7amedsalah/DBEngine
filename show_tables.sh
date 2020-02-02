#!/bin/bash
LC_ALL=C
shopt -s extglob
clear
source use_Database.sh;
function list_Tables
{
  echo
  echo "This Is All Tables"
  echo "-----------------------------------------------------------------------!!";
  for i in *
  do
    if [ -f ./"$i" ]; then
      echo $i;
	source BashProject.sh
    fi
  done
  echo "-----------------------------------------------------------------------!!";
}

list_Tables;


