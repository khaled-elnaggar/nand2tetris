#!/bin/bash

echo "Deleting out/ directory"
rm -rf out/
echo "Making out/ directory"
mkdir out/
echo "Compiling resources ..."
find . -name "*.java" -exec javac -d out/ -cp src/main/java {} \;
echo "Compilation done!"
