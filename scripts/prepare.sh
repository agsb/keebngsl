#! /bin/bash
# agsb@2026

# generic wrapper for clean lines and convert to 'lemma fppm'

case $1 in

        "NGSL") # from NGSL 1.2 list
        cat $2 | sed '1d;' | cut -f 1,4 -d',' | \
        tr ',[:upper:]\t' ' [:lower:] ' |  \
        tr -s ' '
        ;;

        *)
        echo " Do not know about it. "
        ;;
esac

