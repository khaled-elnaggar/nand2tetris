#!/bin/bash

echo "Running HackAssembler on file $1"

java -cp out/ org.nand2tetris.HackAssembler "$1"
