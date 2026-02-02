#!/usr/bin/awk
# agsb@ 2026/02
#
# calculate frequency of letters, digrams, trigrams, tetraphs
#
# input frequencies from converted to 'lemma fppm'
#       lemma a word
#       fppm  a frequency ( in parts per million )
#

# prepare
BEGIN {

        # count lines
        lines = 0

        # sum of counts
        sum = 0.0
                
        }

# read the file
{
        lines++
        
        # skip header at first line
        if (lines == 1) next;

        # skip any comments
        if ($1 == "#") next;

        # wise 
        $0 = tolower ($0)

        words[$1] = $2
        
        # sum all fppms

        sum += 0.0 + $2

        }

END {

        # make percents of corpus
        for ( w in words) {
                
                perc = words[w]*100.0/sum
                
                print "% " w " " perc

                }

        # make frequencies from fppm 
        for ( w in words) {

                # letters
                m = split(w, is, "")
                for ( i = 1; i <= m; i++ ) {
                        k = is[i]
                        sums[k] += 0.0 + words[w]
                        }
                
                # for n-grams, counts with Spaces before and after     
                ws = "S" w "S"
                n = split(ws, is, "")

                # digrams
                for ( i = 1; i < n; i++ ) {
                        k = is[i] is[i+1]
                        sumd[k] += 0.0 + words[w]
                        }

                # trigrams
                for ( i = 1; i < n - 1; i++ ) {
                        k = is[i] is[i+1] is[i+2]
                        sumt[k] += 0.0 + words[w]
                        }

                # quadgrams
                for ( i = 1; i < n - 2; i++ ) {
                        k = is[i] is[i+1] is[i+2] is[i+3]
                        sumq[k] += 0.0 + words[w]
                        }

                }

        # percent frequencies        

        qts = 0
        for ( k in sums) {
                qts += sums[k]
                }
        
        qtd = 0        
        for ( k in sumd) {
                qtd += sumd[k]
                }
        
        qtt = 0        
        for ( k in sumt) {
                qtt += sumt[k]
                }
                
        qtq = 0        
        for ( k in sumq) {
                qtq += sumq[k]
                }
                
        # show frequencies        
        # -- do not try cumulative, because no ordered list
                
        for ( k in sums) { # letters
                v = (sums[k] * 100.0 / qts)
                print "- " k " " v " "
                }
                
        for ( k in sumd) { # digrams
                v = (sumd[k] * 100.0 / qtd)
                print "= " k " " v " "
                }
                
        for ( k in sumt) { # trigrams
                v = (sumt[k] * 100.0 / qtt)
                print "+ " k " " v " "
                }
                
        for ( k in sumq) { # tetragrams
                v = (sumq[k] * 100.0 / qtq)
                print "^ " k " " v " "
                }
                
        # also digrams that no exists
        for ( i in sums ) {
                m = 0.0
                for ( j in sums ) {
                        k = i j
                        if (sumd[k] > 0.0) continue;
                        print "~ " k " 0.0 "
                        m++
                        }
                # how many
                print "? " i " " m
                }

        }


