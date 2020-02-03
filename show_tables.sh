#!/bin/bash
LC_ALL=C
shopt -s extglob
clear
source /home/sabreensalama/Desktop/bash/project/DBEngine/use_Database.sh
function list_Tables() {
  echo
  echo "This Is All Tables"
  echo "-------------------------------------------"
  for i in *; do
    if [ -f ./"$i" ]; then
      echo $i

    fi
  done
  echo "-------------------------------------------"
}

list_Tables

cd /home/sabreensalama/Desktop/bash/project/DBEngine/
source /home/sabreensalama/Desktop/bash/project/DBEngine/DatabaseEngine.sh
