#!/bin/bash

RED="\033[31m"
GREEN="\033[32m"
WHITHE="\033[97m"
RESET="\033[0m"

echo -e "1 -> Create an environment in the current directory.
2 -> Create an environment in an absolute path.
"
while :; do
    echo -ne "${GREEN}Please enter your choice: $RESET"  
    read n
    if ! [[ "$n" =~ ^[0-9]+$ ]]; then
        echo "Enter number please"
    elif [ "$n" -ne 1 ] && [ "$n" -ne 2 ]; then
        echo "Enter 1 or 2 please"
    else
        if [ "$n" -eq 1 ]; then 
	   envPath=$(pwd)
        elif [ "$n" -eq 2 ]; then
            echo -ne "${GREEN}Enter path: $RESET"
            read envPath
        fi

        echo -ne "${GREEN}Enter name of project: $RESET"
        read project
        envPath+="/"
        envPath+=$project
        mkdir -p $envPath
	cd $envPath
        python3 -m venv env
	if [ $? -eq 0 ]; then
			source "$envPath/env/bin/activate" || { echo "Failed to activate virtual environment"; exit 1 ;}
			echo -e "${GREEN}Django is installed$RESET" 
			pip3 install django > /dev/null 2>&1
			echo -e "${GREEN}Start Project $RESET"
			django-admin startproject $project . 	
	else
		echo -e "$RED ERROR $REST"
	fi
        break
    fi
done
