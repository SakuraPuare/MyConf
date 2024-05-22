#!/bin/bash

# Define the blacklist
black_list=(".gitattributes" ".git")

# Loop over all files and directories that start with a dot
for path in .*
do
    # Skip if the path is in the black list
    if [[ " ${black_list[@]} " =~ " ${path} " ]]; then
        continue
    fi

    # Print the path
    echo $path

    # If the path is a directory, sync it
    if [ -d "$path" ]; then
        # If the directory exists in the home directory, remove it
        # DANGER!!!
        # if [ -d ~/$path ]; then
        #     rm -r ~/$path
        # fi

        # Sync the directory to the home directory
        rsync -aq $path ~/
    else
        # If the file exists in the home directory, remove it
        if [ -e ~/$path ]; then
            rm ~/$path
        fi

        # Create a symbolic link to the file in the home directory
        ln -s $(pwd)/$path ~/$path
    fi
done
