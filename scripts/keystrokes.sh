
 >cgs
 >ngs

 for it in ngsl ntsl nawl goog ; do

 cat $it | tr -cd ' [:alnum:]\n' | sed -e " s/\'\-\.//g; s/[adgjmptw]/1/g; s/[behknqux]/22/g; s/[cfilorvy]/333/g; s/[sz]/4444/g;" > $it.cg

 cat $it.cg | awk -f summative.awk >> cgs

 cat $it | tr -cd ' [:alnum:]\n' | sed -e " s/\'\-\.//g; s/[etoanhir]/1/g; s/[slducbfy]/22/g; s/[mwpgvkxj]/333/g; s/[qz]/4444/g;" > $it.ng

 cat $it.ng | awk -f summative.awk >> ngs

 done

 # cat *.cg | awk -f summative.awk >> cgs

 # cat *.ng | awk -f summative.awk >> ngs

