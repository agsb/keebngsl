#!/usr/bin/awk
# agsb@ 2026/02
#

# select bigrams by preference order
# input: sign lemma fppm
#       sign is a symbol
#       lemma is a word or trigram or bigram or ...
#       fppm is the frequency per million, or relative percents
#


BEGIN {

        # define the precedence for lemmas

        w = ARGV[1] 

        # define an ordened sequential array
        n = split (w, it, " ")

        delete ARGV[1]

        m = 0

        }

{
        # input as : sign lemma fppm

        # skip comments
        if ($1 == "^#") next;

        # keep pairs in seqquence order
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

                        wt = ws[i];

                        # verify if apply 

                        if ( sub(/^w/, "", wt) < 0 ) continue;

                        # verify if already used 

                        if ( sub(/wt/, wt, fs) > 0 ) continue;

                        # merge in list
                        
                        fs = fs wt

                        # show it

                        print "~ " ws[i] " " vs[i] " "
                
                        sum += 0.0 + vs[i]

                        break; 

                        }
                
                }
                
        print "# total " sum " "
        }        


