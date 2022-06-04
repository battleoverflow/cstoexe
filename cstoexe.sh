#!/bin/bash

#########################################################
# Author: Hifumi1337                                    #
# Version: 1.0.3                                        #
# Project: https://github.com/Hifumi1337/cstoexe        #
# Created: 09/16/2021                                   #
#########################################################

function banner {
    echo
    echo "Author: Hifumi1337 (https://github.com/Hifumi1337)"
    echo "Version: 1.0.3"
    echo "Project: https://github.com/Hifumi1337/cstoexe"
    echo
}

# Must have sudo permissions for a clean install

function cstoexe {

    banner

    # Installs required package
    if ! which mono > /dev/null; then
        echo -e "Command is not present. Would you like to install it (y/n)? \c"
        read user_reply
        
        if "$user_reply" = "y"; then
            # Updates current packages
            sudo apt update

            echo

            mono_install = "sudo apt install mono-complete"
            echo $mono_install
        fi

    else
        echo "Mono is already installed"
        echo
    fi

    echo -n "Input the name of your C# file without the extension (ex: fileName): "
    read csFileName

    # Converts C# script to an executable 
    mcs -out:$csFileName $csFileName.cs

    echo -n "Would you like to run your new executable (y/n): "
    read answer

    if [ "$answer" == "y" ]
    then
        # Runs/prints generated exe file
        mono $csFileName
    else
        echo "Thank you for using cstoexe!"
    fi   
}

cstoexe