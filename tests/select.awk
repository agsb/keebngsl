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
        ws[n] = $2 
        vs[n] = $3

        }

END {
        # select by order

        m = 1

        n++

        fs=" "

        gs=" "

        for (k = 1; k < 9; k++ ) {

        for (p = m; p < n; p++) {

                m = split (ws[p],is,"")      
                
                t = index(fs,is[1])

                if (t != 0) continue;
                
                t = index(gs,is[2])

                if (t != 0) continue;

                fs = fs is[1]
                
                gs = gs is[2]

                print "~ " ws[p] " " vs[p] " "
                
                break; 

                }

                m = p;
        }
}        


