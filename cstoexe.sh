#!/bin/bash

# If you want a C# file to test, use this in a seperate file called hello.cs or whatever you'd like
# --------------------------------------------
# using System;
#
# class HelloWorld {
#   static void Main() {
#     Console.WriteLine("Hello World!");
#   }
# }
#--------------------------------------------

#########################################################
# Creator: Hifumi Sec                                   #
# Created: 09/16/2021                                   #
# Version: 1.0.0                                        #
# Project: https://github.com/Hifumi-Sec/cstoexe        #
#########################################################

echo
echo "Creator: Hifumi Sec (https://github.com/Hifumi-Sec)"
echo "Version: 1.0.0"
echo "Project: https://github.com/Hifumi-Sec/cstoexe"
echo "Support the dev: https://github.com/sponsors/hifumi-sec"
echo

# Must have sudo permissions for a clean install

# Updates current packages
sudo apt update

# Installs required package
if ! which mono > /dev/null; then
    echo -e "Command is not present. Would you like to install it (y/n)? \c"
    read user_reply
    if "$user_reply" = "y"; then
        mono_install = "sudo apt install mono-complete"
        echo $mono_install
    fi
else
    echo "Mono is already installed."
fi

echo -n "Input the name of your C# file without the extension (ex: fileName): "
read csFileName


# Converts C# script to an executable 
mcs -out:$csFileName.exe $csFileName.cs

echo -n "Would you like to run your new executable (y/n): "
read answer

if [ "$answer" == "y" ]
then
    # Runs/prints generated exe file
    mono $csFileName.exe
else
    echo "Thank you for using cstoexe!"
fi
