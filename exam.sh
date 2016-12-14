#!/bin/bash

file="$1"
 
 if [ -z "$file" ] #Blank argument, script will terminate.
 
  then
    echo "Please indicate file... Exiting."
    exit
  
  else 
    echo ======= Starting
    trap "echo Exited!; exit;" SIGINT SIGTERM # Controlled Exit (Crtl-c)
    
    while true; 
    do
     LL=`cat access.log | cut -d '"' -f3 | cut -d ' ' -f2 | sort | uniq | sed '/^\s*#/d;/^\s*$/d' | xargs` # search unique http codes
     count=`cat access.log | cut -d '"' -f3 | cut -d ' ' -f2 | sort | uniq | sed '/^\s*#/d;/^\s*$/d' |  wc -l` #count number of unique http codes
     IFS=' ' declare -a 'codes_list=($LL)' #Input values to array
        sleep 5 # Delay 5 seconds for viewing purposes
        for ((i=0; i<$count; i++));
        do
            c=`grep ${codes_list[i]} $file |  wc -l` #count unique codes
            echo http codes ${codes_list[i]}: $c # print unique codes and counts
        done
        echo ======= 
	done
fi
