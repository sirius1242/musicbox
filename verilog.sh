#!/bin/bash

awk -v _offset=$2 '{$1 += _offset } {print "data["$1"][11:8]<="$2";data["$1"][7:5]<="$3";data["$1"][4:0]<="$4";"}' $1
