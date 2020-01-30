#!/bin/bash
LC_ALL=C
shopt -s extglob

function check_table_exist
{
  if [ -f "$table_name" ]; then
    return 0;
  else
    return 1;
  fi
}
