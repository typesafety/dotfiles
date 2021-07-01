#!/bin/sh
# Saves explicitly installed packages (native/foreign) to text files.

pacman -Qent > $HOME/.dotfiles/native-packages.txt
pacman -Qm > $HOME/.dotfiles/foreign-packages.txt

