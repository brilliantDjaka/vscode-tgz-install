#!/bin/bash

if ! command -v wget >/dev/null 2>&1 ; then
    echo "wget is required"
    exit 1
fi

rm -rf "/tmp/vscode-tgz-installer"

mkdir "/tmp/vscode-tgz-installer"


wget "https://code.visualstudio.com/sha/download?build=stable&os=linux-x64" --output-document="/tmp/vscode-tgz-installer/code.tar.gz"

mkdir ~/Applications 2> /dev/null

rm -rf ~/Applications/VSCode-linux-x64

tar zxvf /tmp/vscode-tgz-installer/code.tar.gz -C ~/Applications

mkdir ~/.local/bin 2> /dev/null

rm -f ~/.local/bin/code

ln -s ~/Applications/VSCode-linux-x64/bin/code ~/.local/bin/code

rm -f ~/.local/share/applications/code.desktop

cat > ~/.local/share/applications/code.desktop <<EOF

[Desktop Entry]

# The type as listed above
Type=Application

# The name of the application
Name=Visual Studio Code

# A comment which can/will be used as a tooltip
#Comment=Flash card based learning tool

# The executable of the application, possibly with arguments.
Exec=code

# The name of the icon that will be used to display this entry
Icon=$HOME/Applications/VSCode-linux-x64/resources/app/resources/linux/code.png

# Describes whether this application needs to be run in a terminal or not
Terminal=false

# Describes the categories in which this entry should be shown
Categories=IDE;Programming

EOF
