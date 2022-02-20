#!/bin/bash

#########################################################
# Creator: Hifumi1337                                   #
# Created: 09/16/2021                                   #
# Version: 1.0.2                                        #
# Project: https://github.com/Hifumi1337/cstoexe        #
#########################################################

echo
echo "Creator: Hifumi1337 (https://github.com/Hifumi1337)"
echo "Version: 1.0.2"
echo "Project: https://github.com/Hifumi1337/cstoexe"
echo "Support the dev: https://github.com/sponsors/hifumi1337"
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
