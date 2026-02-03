#!/usr/bin/awk
# agsb@ 2026/02
#

# select bigrams by preference order
# input: - lemma fppm
#       lemma is a bigram
#       fppm is the frequency per million, or relative percents
#


BEGIN {

        n = 0
        
        }

{
        # skip comments
        if ($1 == "^#") next;

        # keep pairs in order
        n++
        ws[n] = $2 
        vs[n] = $3

        }

END {
        # select by order

        # start index
        m = 1

        # limit index
        n++

        # already used first characters of bigram
        fs=" "

        # already used second character of bigram
        gs=" "

        # for each key
        for (k = 1; k < 9; k++ ) {

        # the order is prevalent
        for (i = m; i < n; i++) {

                m = split (ws[i],is,"")      
                
                # verify if used 
                t = index(fs,is[1])
                if (t != 0) continue;
                
                # verify if used 
                t = index(gs,is[2])
                if (t != 0) continue;

                # merge in lists
                fs = fs is[1]
                gs = gs is[2]

                # show it
                print "~ " ws[i] " " vs[i] " "
                
                break; 

                }
                
        # skip previous matchs
        m = p;
        }
}        


