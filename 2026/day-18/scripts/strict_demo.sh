#!/bin/bash

test_u(){
	echo "Testing set_u"
	set -u
	echo "name:$name"
	echo"name will not print"
}

test_e(){
	echo "Testing set_e"
	set -e
	ls file not exist
	echo "This will not print"

}

test_pipefail(){
	echo "Testing pipefail"
	set -e -o pipefail
	cat not_exist.txt|grep hello
	echo "this will not print"
}

test_u
test_e
test_pipefail


