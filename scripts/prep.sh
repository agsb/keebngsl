#! /bin/bash

# clean lines, convert to 'lemma fppm'

case $1 in

        1) # from NGSL 1.2 list
        cat $2 | cut -f 1,4 -d',' | \
        tr ',[:upper:]\t' ' [:lower:] ' |  tr -s ' ' > z0
        ;;

        *)
        echo " Do not know about it. "
        ;;
esac

