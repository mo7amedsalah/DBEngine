#!/bin/bash
LC_ALL=C
shopt -s extglob

function check_table_exist() {

  if [ -f $1 ]; then
    return 0
  else
    return 1
  fi
}
check_table_exist $1
