
 # clean

 > cgs
 > ngs
 > fcs


 # corpus, lemma fpm

 for it in ngsl ntsl nawl goog ; do

# full keyboard

 cat $it | tr -cd ' [:alnum:]\n' | sed -e " s/\'\-\.//g; s/[abcdefghijklmnopqrstuvwxyz]/1/g; " > $it.fg

 echo $it >> fgs
 cat $it.fg | awk -f summative.awk >> fgs

# common layout

 cat $it | tr -cd ' [:alnum:]\n' | sed -e " s/\'\-\.//g; s/[adgjmptw]/1/g; s/[behknqux]/22/g; s/[cfilorvy]/333/g; s/[sz]/4444/g;" > $it.cg

 echo $it >> cgs
 cat $it.cg | awk -f summative.awk >> cgs

# ngsl layout

 cat $it | tr -cd ' [:alnum:]\n' | sed -e " s/\'\-\.//g; s/[etoanhir]/1/g; s/[slducbfy]/22/g; s/[mwpgvkxj]/333/g; s/[qz]/4444/g;" > $it.ng

 echo $it >> ngs
 cat $it.ng | awk -f summative.awk >> ngs

 done

