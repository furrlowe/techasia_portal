#!/bin/bash

file="$1" #filename

if [ -z "$file" ] #Blank argument
 
  then
    echo "Please indicate file... Exiting."
    exit
  
  else 

  	VAR_200=`awk '($9 ~ /200/)' $file |  wc -l`
        VAR_404=`awk '($9 ~ /404/)' $file |  wc -l`
        VAR_444=`awk '($9 ~ /444/)' $file |  wc -l`
	  
          echo ======= Starting
	  echo http code 200: $VAR_200
	  echo http code 404: $VAR_404
	  echo http code 444: $VAR_444
	  sleep 3 # Delay 3 seconds
	  
	  trap "echo Exited!; exit;" SIGINT SIGTERM
		while true; do
     		VAR_200=`awk '($9 ~ /200/)' $file |  wc -l`
     		VAR_404=`awk '($9 ~ /404/)' $file |  wc -l`
     		VAR_444=`awk '($9 ~ /444/)' $file |  wc -l`
        
                echo =======
     		echo http code 200: $VAR_200
     		echo http code 404: $VAR_404
     		echo http code 444: $VAR_444
     		sleep 5 # Delay 5 seconds
		done
fi	
