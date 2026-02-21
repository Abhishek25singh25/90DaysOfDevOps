#!/bin/bash

read -p "Enter the number : " num

while [ $num -ge 0 ]

do
      echo $num
      num=$((num-1))
done

    echo "loops end"
