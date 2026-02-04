#!/usr/bin/awk
# agsb@ 2026/02
#

# select bigrams by preference order
# input: - lemma fppm
#       lemma is a bigram
#       fppm is the frequency per million, or relative percents
#


BEGIN {

        # define the order for characters

        cs = ARGV[1] 

        # define the ordened sequential array
        n = split (cs, it, "")

        delete ARGV[1]

        m = 0

        }

{
        # skip comments
        if ($1 == "^#") next;

        # keep pairs in order
        m++
        ws[m] = $2 
        vs[m] = $3

        }

END {
        # select by order

        # already used first characters of bigram
        fs=" "

        # already used second character of bigram
        gs=" "

        # for easy
        m++

        sum = 0

        # the list order is prevalent
        for (k = 1; k < n; k++) {

                w = it[k];

                for (i = 1; i < m; i++) {

                        t = split (ws[i],is,"")      
                
                        if (w != is[1]) continue;

                        # verify if already used 
                        t = index(fs,is[1])
                        if (t != 0) continue;
                
                        # verify if already used 
                        t = index(gs,is[2])
                        if (t != 0) continue;

                        # merge in lists
                        fs = fs is[1]
                        gs = gs is[2]

                        # show it
                        print "~ " ws[i] " " vs[i] " "
                
                        sum += 0.0 + vs[i]

                        break; 

                        }
                
                }
                
        print "# total " sum " "
        }        


