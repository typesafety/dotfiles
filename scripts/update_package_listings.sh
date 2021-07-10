#!/bin/sh
# Saves explicitly installed packages (native/foreign) to text files.

pacman -Qentt > $HOME/.dotfiles/native-packages.txt
pacman -Qm > $HOME/.dotfiles/foreign-packages.txt

