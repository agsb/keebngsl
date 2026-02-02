#!/usr/bin/awk
# agsb@ 2026/02
#
#       from a list with bigrams and percents
#

BEGIN {
        n = 0
        
        }

{
        # skip comments
        if ($1 == "#") next;

        # keep values in order
        n++
        w[n] = $2 
        v[n] = $3

        }

END {
        # select by order


        for (k = 1; k < 9; k++ ) {

        m = 1

        n++

        for (i = m; i < n; i++) {
        
                
                
                


      }
