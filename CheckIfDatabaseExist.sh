#!/bin/bash
LC_ALL=C
function check_database_exist() if [ -d $1 ]; then
  return 0
else
  return 1
fi
check_database_exist $1
