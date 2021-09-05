#!/bin/sh
# Saves explicitly installed packages (native/foreign) to text files.

pacman -Qenq > $HOME/.dotfiles/native-packages.txt
pacman -Qemq > $HOME/.dotfiles/foreign-packages.txt

