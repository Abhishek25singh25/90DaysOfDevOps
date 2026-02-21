#!/bin/bash

greet(){
echo "Hello,$1"
}

sum() {
result=$(( $1+$2 ))
echo "sum is : $result"
}

greet Abhishek
sum 4 5




