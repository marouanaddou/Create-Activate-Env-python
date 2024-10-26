#!/bin/bash

RED="\e[31m"
GREEN="\e[32m"
WHITHE="\e[97m"
RESET="\033[0m"

echo "Enter:
1 -> Create an environment in the current directory.
2 -> Create an environment in an absolute path.
"
while :; do
    echo -n "Please enter your choice: "  
    read n
    if ! [[ "$n" =~ ^[0-9]+$ ]]; then
        echo "Enter number please"
    elif [ "$n" -ne 1 ] && [ "$n" -ne 2 ]; then
        echo "Enter 1 or 2 please"
    else
        if [ "$n" -eq 1 ]; then 
            current_path=$(pwd)
        elif [ "$n" -eq 2 ]; then
            echo -n "Enter path: "
            read path
        fi

        echo -n "Enter name of folder project: "
        read project
        current_path+="/"
        current_path+=$project

        mkdir -p $current_path

        # Create Virtual Environment
        if [ "$?" -ne 0 ]; then 
            echo "Error in create folder project"
        else 
            cd $current_path
            echo -n "Enter name of Virtual Environment: "
            read envi 
            python3 -m venv $envi

		# Activate the Virtual Environment
			source "$current_path/$envi/bin/activate" || { echo "Failed to activate virtual environment"; exit 1 ;}
			
		# Install Django
			echo "\n$GREEN Install Django $RESET\n" 
			pip3 install django

  		# Enter in the Virtual Environment
			cd ./$envi	

		# Start Project
			echo -n "$GREEN Please enter name of project: $RESET" 
			read name
			echo "\n$GREEN Start Project $RESET\n"
			django-admin startproject $name 	

		# Enter to project 
			cd $name
			# echo "\n $GREEN Run Server $RESET\n"
			# python manage.py runserver
		fi
        break
    fi
done
