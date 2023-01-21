#!/bin/bash

# Provide a way to ask for the architecture which the user want to assemble the code

receivedFile=$1 # assign the arguement passed to a variable
ext=".asm" # define the file extension expected

fileNoExt=${receivedFile%%$ext} # remove the file extension from the received filename

dotOFile=$fileNoExt".o" # add a {.o} to the file extension

echo "Executing $receivedFile"
echo "The executable file will be preserved as '$fileNoExt'"

# run the commands to assemble the code and execute
nasm -felf64 $receivedFile -o $dotOFile
ld -o $fileNoExt $dotOFile
./$fileNoExt
rm $dotOFile # delete the file with the '.o' extension