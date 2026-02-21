#!/bin/bash


#!/bin/bash

echo "===== Local Variable Demo ====="

local_func() {
    local name="Abhishek"
    echo "Inside local_func: $name"
}

local_func
echo "Outside local_func: $name"   


echo ""
echo "===== Global Variable Demo ====="

global_func() {
    name="Abhishek"
    echo "Inside global_func: $name"
}

global_func
echo "Outside global_func: $name"  

