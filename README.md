# TOKEEBS

A new comfortable and efficient layout for numeric keyboards, to allow 12 keys be used for digits, characters, symbols and functions. 

## Problem

What could be the best comfortable and efficient design for a numerical 12 keys that allows use of numbers, characters, symbols and controls ?

Frequency analysis was performed using the NGSL 1.2 list of 2809 words to determine the frequencies of characters, bigrams, trigrams, and tetragrams, and the results are evaluated to determine the character combination per key that resulting in the lowest collision count. That combination was selected for a comfortable and efficient layout.

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
    One key ( 1 ) for space and backspace.
    Eigth keys ( 2, 3, 4, 5, 6, 7, 8, 9 ) for multiple use.
    Three keys (* 0 #) for define mode and controls
    
    Maybe:
       0  use for common symbols comma, dot, question. 
       \*  reserved for 12 selects as characters, symbols, functions, etc
       \#  reserved for controls, as select + group of keys + execute, and alone to ends key repeats

With one key for space or backspace, and **8 keys for 26 characters**, then 6 keys with 3 characters and 2 keys with four. 

## NGSL

Using the frequency of characters on NGLS and minimize finger movement for most used words.

## Process

All processing are done using AWK and Bash scripts and common GNU Linux tools.

(Check the code)[https://github.com/agsb/keebngsl/blob/scripts/],if you're curious about the details.

### The frequencies

The reference word list used was the 2809 words of NGSL 1.2, represented as "lemma fppm", where lemma is a word and fppm is the absolute frequency of lemma per million. That corpus is equivalent to a book with 853,976 words. 

For each character the fppm of ocurrences in all lemmas are normalized as absolute percentual relative to corpus, same process for bigrams, trigrams and tetragrams, including space at begin and end, to form the normal use of lemmas, also unused digraphs are listed.

The result frequency tables for [characters](https://github.com/agsb/keebngsl/blob/main/characters.md), [bigrams](https://github.com/agsb/keebngsl/blob/main/bigrams.md), [trigrams](https://github.com/agsb/keebngsl/blob/main/trigrams.md), tetragraphs and for not found digraphs are at ...

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
    
In groups of eight keys **e t o a n h i r // s l d u c b f y // m w p g v k x j // q z**.

The tables for n-grams are in ...

A logical option for minimize the number of keystrokes is combine one character of each group per key, selected with digraphs and trigraphs with lowerest frequencies. ( Using ..... )

The digraphs with first character from group one _e t o a n h i r_ with second character from group two _s l d u c b f y_ were selected from the list frequencies of digraphs and complemented witht frequency 0.0 for those inexistent. Then use brute force for select best lower overall combinations.

## Results

Using the initial NGLS list as corpus and counting the ocurrencies as ppm (0.853976) for numeric keyboard, shows:

| design | keystrokes | layout | 
| -- | -- | -- | 
| full keyboard | 3.30764 | abcdefghijklmnopqrstuvwxyz |
| common layout | 7.02167 | _,@ abc def ghi jkl mno pqrs tuv wxyz * 0 # | 
| design layout | 4.80558 | space afp obg tdx hym euk nlvq icj rswz * 0 # |

Adicional functions are assigned to __* 0 #__

The common layout show a 112.286 % effort over a full keyboard, and the design layout only 45.287 % 

## Lists used

    ngls    ngsl-1.2 

    ngrf    google books n-gram, full

    ngrp    google books n-gram, only > 1

## References

https://en.wikipedia.org/wiki/N-gram

https://research.google/blog/all-our-n-gram-are-belong-to-you/

https://newgeneralservicelist/s/NGSL_12_stats.csv

https://newgeneralservicelist/s/NAWL_10_stats.csv


