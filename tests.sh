#!/bin/sh

cmd="sh release.sh"
result=`{ $cmd; } 2>&1`;
matches=`echo $result | egrep 'Ex' | wc -l`
if [ $matches -eq 0 ]
then
  echo "Fail"
  exit 1;
fi
echo "Pass"

# throws when no argument is passed
