#!/usr/bin/bash

# agsb@2026
# convert characters to number of touchs
# not counting separator for repeats

# using common design, adgj
sed -e " s/[adgjmptw]/1/g; s/[behknqux]/22/g; s/[cfilorvy]/333/g; s/[sz]/4444/g;"

