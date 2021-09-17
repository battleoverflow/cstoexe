#!/bin/bash

# Must have sudo permissions for a clean install

# Updates current packages
# sudo apt update

echo "Input the name of your C# file without the extension (ex: fileName):"
echo -n "$ "
read csFileName

# Installs required package
# sudo apt install mono-complete

mcs -out:$csFileName.exe $csFileName.cs

echo -n "Would you like to run your new executable (y/n): "
read answer

if [ "$answer" == "y" ]
then
    mono $csFileName.exe
else
    echo "Thank you for using cstoexe!"
fi