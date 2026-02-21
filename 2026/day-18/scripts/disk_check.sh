#!/bin/bash


check_disk(){
df -h /
}

check_memory(){
free -h
}

main() {
	
echo "Total disk space used is "
check_disk

echo "Total memory space used is"
check_memory

}

main
