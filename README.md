# TOKEEBS

A new comfortable and layout for numeric keyboards, to allow 12 keys be used for digits, characters, symbols and functions, at least 30% efficient than usual (common) layout.  

## Sumary

What could be the best comfortable layout for a numerical 12 keys that allows use of numbers, characters, symbols and controls ?

Every language obey to [Zipf's Law](https://en.wikipedia.org/wiki/Zipf%27s_law), and any keyboard could be more efficient when keep it in mind.

Frequency analysis was performed using the NGSL 1.2 list of 2809 words to determine the frequencies of characters, bigrams, trigrams, and tetragrams, and the results are evaluated to determine the character combination per key that resulting in the lowest collision count and minimal keystrokes. 

The tuples **space, afp, euk, hym, icj, nlvq, obg, rswz, tdx**  was selected for a minimal keystrokes. The best layout is being researched.

## Telephone numeric 12 keyboard

The common 12 keys numeric keyboard was designed by Sundstrand’s, the 10-key adding machine, in 1914.
Historic references at https://uxdesign.cc/a-brief-history-of-the-numeric-keypad-59112cbf4c49

Old telephone keyboards have a character layout over the numeric 12 keys, but to access the keys must press it 1 or 2 or 3 times, like 8(t)44(h)-1-444(i)7777(s)

| key | 1st | 2nd | 3rd | 4th |
| -- | -- | -- | -- | -- |
   | 1 | record on/off
   | 2 | a|b|c| |
   | 3 | d|e|f| |
   | 4 | g|h|i| |
   | 5 | j|k|l| |
   | 6 | m|n|o| |
   | 7 | p|q|r|s |
   | 8 | t|u|v| |
   | 9 | w|x|y|z |
   | 0 | space | | | |
   | * | 1|a|?| | |
   | # | shift on/off |

## Restrictions

The layout must be use an 12 keys basic numeric keypad as above and follow 

    Assign keys order from frequency lists. 
    Balance the layout to minimize keystrokes. 
    Avoid bigrams and trigrams on the same key.
    
    One key for space and backspace.
    Eigth keys for multiple use.
    Three keys (* 0 #) for define mode and controls
    
    Maybe:
       0  use for 0 break, 00 cancel break. Break is a end-of-character. 
       \*  reserved for 12 selects as characters, symbols, functions, etc
       \#  reserved for controls, as select + group of keys + execute, and alone to ends key repeats

With one key for space or backspace, and 8 keys for 26 characters, then 6 keys with 3 characters and 2 keys with four. 

## NGSL

Using the frequency of characters on NGLS and minimize finger movement for most used words.

## Process

All processing are done using AWK and Bash scripts and common GNU Linux tools.

Please [Check the code](https://github.com/agsb/keebngsl/tree/main/scripts), if you're curious about the details.

### The frequencies

The reference word list used was the 2809 words of NGSL 1.2, represented as "lemma fppm", where lemma is a word and fppm is the absolute frequency of lemma per million. That corpus is equivalent to a book with 853,976 words. 

For each character the fppm of ocurrences in all lemmas are normalized as absolute percentual relative to corpus, same process for bigrams, trigrams and tetragrams, including space at begin and end, to form the normal use of lemmas, also unused digraphs are listed.

The result frequency tables for [characters](https://github.com/agsb/keebngsl/blob/main/tables/characters.md), [bigrams](https://github.com/agsb/keebngsl/blob/main/tables/bigrams.md) and [trigrams](https://github.com/agsb/keebngsl/blob/main/tables/trigrams.md). 

Also shows [tetragrams](https://github.com/agsb/keebngsl/blob/main/tables/tetragrams.md) and [not found](https://github.com/agsb/keebngsl/tree/main/tables/notfounds.md) digrams, which are maybe usefull for represent a full word as combination of inexistant digraphs.

Tables with bigrams [beginning](https://github.com/agsb/keebngsl/blob/main/tables/beginnings.md) or [ending](https://github.com/agsb/keebngsl/blob/main/tables/endings.md) with space.  

### The combinations

After processing, the order of characters from high to lower frequencies, in percents of corpus, are:

| character | absolute | cumulative |
| -- | -- | -- |
| e | 13.9686 | 13.9686 |
| t | 10.2715 | 24.2401 |
| o | 8.86967 | 33.1098 |
| a | 8.07339 | 41.1832 |
| n | 6.54034 | 47.7235 |
| h | 6.1649 | 53.8884 |
| i | 5.98081 | 59.8692 |
| r | 5.25755 | 65.1268 |
| s | 4.16692 | 69.2937 |
| l | 4.02622 | 73.3199 |
| d | 3.13398 | 76.4539 |
| u | 2.83425 | 79.2881 |
| c | 2.77164 | 82.0598 |
| b | 2.72269 | 84.7825 |
| f | 2.59027 | 87.3727 |
| y | 2.34378 | 89.7165 |
| m | 2.17526 | 91.8918 |
| w | 2.15691 | 94.0487 |
| p | 1.92028 | 95.969 |
| g | 1.4201 | 97.3891 |
| v | 1.30948 | 98.6985 |
| k | 0.86415 | 99.5627 |
| x | 0.177377 | 99.7401 |
| j | 0.129548 | 99.8696 |
| q | 0.088492 | 99.9581 |
| z | 0.0418727 | 100 |
|  |  |  |
    
In groups of eight keys 

      **// e t o a n h i r // s l d u c b f y // m w p g v k x j // q z //**.

The tables for n-grams are in [results](https://github.com/agsb/keebngsl/blob/tables/)

A logical option for minimize the number of keystrokes is combine one character of each group per key, selected with lowerest frequencies. 

The bigrams with first character from group one **e t o a n h i r** with second character from group two **s l d u c b f y** were selected from the list frequencies of bigrams for the lowerst frequency, then those bigrams are combined with third from the group **m w p g v k x j** also for the lowerst frequency.   

The n-gram with space at begin or end have more than 20% of all ocurrences. The space deserves an uniq key.

## Prediction

_work in progress_ for use [partial matching](https://en.wikipedia.org/wiki/Prediction_by_partial_matching) and [arithmetic coding](https://en.wikipedia.org/wiki/Arithmetic_coding).

# the tuples

**e t o a n h i r // s l d u c b f y // m w p g v k x j // q z**

The tuples defined as **space/backspace, euk, tdx, obg, afp, nlvq, hym, icj, rswz**. Note, **q** and **z** could be placed in any key except space. 

With the tuples defined, now the layout is a ergonomic question.

| | | |
| --- | --- | --- | 
| 1 I C J  | 2 A F P  | 3 O B G  |
| 4 T D X  | 5 H Y M  | 6 E V K  |
| 7 N L V Q | 8 R S W Z | 9 space/bck |
| * | 0 | # |

OR 

| | | |
| --- | --- | --- | 
| 1 N L V Q | 2 O B G  | 3 R S W Z |
| 4 T D X  | 5 H Y M  | 6 E V K  |
| 7 A F P  | 8 I C J | 9 space/bck |
| * | 0 | # |

## Results

Using the initial NGLS list as corpus and counting the ocurrencies as fpm (853,976 in 1,000,000) for numeric keyboard, after substitute the characters by number of keystrokes and counting the keystrokes, shows (in ppm) :

| design | keystrokes | design | 
| -- | -- | -- | 
| full keyboard | 3.30764 | abcdefghijklmnopqrstuvwxyz |
| common tuples | 7.02167 | _,@ abc def ghi jkl mno pqrs tuv wxyz * 0 # | 
| ngsl tuples | 4.80558 | icj afp obg tdx hym euk nlvq rswz space * 0 # |

Adicional functions are assigned to __* 0 #__. An assign could be: 
   0 acts as break eg. "after" is "2022468" , 00 cancel break, etc
   __*__ acts as multiple selector, *0 is backspace, *1 ... , _**_ cancels

With a full keyboard as reference, the common tuples show a overhead of 112.29% effort and this ngsl tuples only 45.29%. 

Comparing the keystrokes using the lists NGSL-1.2, NTSL-1.0, NAWL-1.0, curated lists, and Google, raw list, using words and counts, as corpus:

### Lists for corpus

      total in fppm is the frequency per million and lemma is a word
      
| List | total | words |
| --- | --- | --- |
| ngsl | 853976 | 2809 |
| ntsl | 46274 | 1250 |
| nawl | 40594 | 930 |
| google | 27676915057 | 97565 |

### full keyboard

   Full keyboard assign 1 key for each character, reference
   
| List | keystrokes | mean | effort |
| --- | --- | --- | --- |
| ngsl | 3307643 | 3.87323 | 1.0 |
| ntsl | 299038  | 7.5715 | 1.0 |
| nawl | 334986 | 8.25211 | 1.0 |
| goog | 221009132891 | 7.59085 | 1.0 |

### common design 

   Common design assign **abc def ghi jkl mno pqrs tuv wxyz space**, mean 2,2015
   
| List | keystrokes | mean lenght | effort | 
| --- | --- | --- | -- |
| ngsl | 7021666 | 8.22232 | 2,1229 | 
| ntsl | 588421 | 16.8077 | 2,2199 |
| nawl | 746993 | 18.4016 | 2,2299 |
| goog | 469166256045 | 16.9515 | 2,2331 |

### ngsl design 

   NGSL design assign **icj afp obg tdx hym euk nlvq rswz space**, mean 1,4938 
   
| List | keystrokes | mean lenght | effort
| --- | --- | --- | -- | 
| ngsl | 4805579 | 5.6273 |  1,4529 |
| ntsl | 88845662 | 11.4044 | 1,5062 |
| nawl | 493141 | 12.1481 | 1,4721 |
| goog | 324378728840 | 11.7202 | 1,5440 | 

## Lists used

    FullWordFrequencyGoogle.csv   
    NGSL_12_stats.csv  
    NAWL_10_stats.csv 
    TSL_12_stats.csv
    
## References

https://www.newgeneralservicelist.org/

https://en.wikipedia.org/wiki/N-gram

https://research.google/blog/all-our-n-gram-are-belong-to-you/

https://newgeneralservicelist/s/NGSL_12_stats.csv

https://newgeneralservicelist/s/NAWL_10_stats.csv


