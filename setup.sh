#!/bin/bash

# Check if pre-commit is installed
if ! command -v pre-commit &> /dev/null; then
    echo "pre-commit is not installed."

    # Ask the user if they want to install pre-commit
    read -p "Do you want to install pre-commit? (y/n): " install_choice

    if [ "$install_choice" == "y" ] || [ "$install_choice" == "Y" ]; then
        # Check if Homebrew is installed
        if command -v brew &> /dev/null; then
            brew install pre-commit
            echo "pre-commit has been installed successfully."
        else
            echo "Homebrew is not installed. Please install Homebrew and then run the following command to install pre-commit:"
            echo "brew install pre-commit"
            echo "For Homebrew installation, visit: https://brew.sh/"
            exit 1
        fi
    else
        echo "You chose not to install pre-commit. You can manually install it from: https://pre-commit.com/#installation"
        exit 1
    fi
fi

exec pre-commit install
