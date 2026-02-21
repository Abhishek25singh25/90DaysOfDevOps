#!/bin/bash

if [ "$UEID" -ne 0 ]
then
	echo "please run this script as root"
	echo "use sudo ./install_package.sh"
	exit 1

fi

packages=("nginx" "wget" "curl")

for pkg in "${packages[@]}"

do
	echo "checking $pkg"

   if dpkg -s "$pkg" > /dev/null 2>&1

   then 
	  echo "$pkg already exist"
   
   else  
         echo "$pkg is not installed ... isntalling package"
         
            apt install -y "$pkg"

         echo "package installed succesfully ! now you can use these package on your system"

fi
done

