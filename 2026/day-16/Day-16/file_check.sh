#!/bin/bash

read -p "Enter the Filename you want to check:" Filename

if [ -f $Filename ]
	
then
       echo "File exist"

else
       echo "File not exist"

fi       


