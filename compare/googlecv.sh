cat $1 | cut -f 1,2 -d',' | sed -e '1d; s/\.//g;' | tr '[:upper:],wq' '[:lower:] ' | awk ' { $2 = $2/1000000; print $1 " " $2 } '
