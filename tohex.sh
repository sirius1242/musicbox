#!/usr/bin/zsh

awk '{printf("%x\n", $1 * 256 + $2 * 32 + $3)}' $1
