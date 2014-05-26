#!/bin/sh
if [ "$#" -eq 6 ]; then
  groovy run_test.groovy "$@"
else
 echo           Incorrect parameters!
 echo			Format:
 echo			run_test.sh -p [/path/to/wiperdog/] -s [String_connect_mongodb] -c [Folder_Test_Case]
 echo			Example:
 echo			run_test.sh -p /home/mrtit/Wiperdog/1205Wiperdog/ -s 10.0.1.189:27017/wiperdog -c Case1
fi
