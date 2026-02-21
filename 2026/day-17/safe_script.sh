#!/bin/bash


set -e

echo "creating directory"

mkdir /tmp/devops-test || echo "failed to create directory"

echo "entering in a directory"

cd /tmp/devops-test || echo "failed to navigate"

echo " creating a file"

touch test-file.txt || echo "failed to create a file"

echo "All steps done"


