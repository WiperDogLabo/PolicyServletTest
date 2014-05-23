#!/bin/sh
if [ "$#" -eq 2 ]; then 
  groovy run_test.groovy "$@"
elif [ "$#" -eq 4 ]; then
  groovy run_test.groovy "$@"
elif [ "$#" -eq 6 ]; then
  groovy run_test.groovy "$@"
else
 echo           Incorrect parameters!
 echo			Example:
 echo			run_test.sh -p [/path/to/wiperdog/] -t [filetest.js]
fi
