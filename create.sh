#!/usr/bin/zsh

tac table.txt |while read line; do sed -i $line $1 ; done
