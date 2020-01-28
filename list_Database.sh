#!/bin/bash
LC_ALL=C
function list_Databases
{
  echo
  echo "This Is All DataBases"
  echo "-----------------------------------------------------------------------!!";
  for i in *
  do
    if [ -d ./"$i" ]; then
      echo $i;
    fi
  done
  echo "-----------------------------------------------------------------------!!";
}

list_Databases;
