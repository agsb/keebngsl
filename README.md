# TOKEEBS

A new comfortable and efficient layout for numeric keyboards, to allow 12 keys be used for digits, letters, symbols and functions. 

## Problem

What could be the best comfortable and efficient design for a numerical 12 keys that allows use of numbers, letters, symbols and controls ?

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


What could be a better layout ? 

## Restrictions

    Assign keys in order frequency list. 
    Balance counts to minimize overuse,
    Avoid digraph in same key, 
    Avoid trigraph in same key, 

    1  used for space and backspace
    2, 3, 4, 5, 6, 7, 8, 9 for multiple characters or symbols

    Maybe:
    0  use for common symbols comma, dot, question. 
    \*  reserved for 12 selects as letters, symbols, functions, etc
    \#  reserved for controls, as select + group of keys + execute, and alone to ends key repeats

With one key for space or backspace, and **8 keys for 26 letters**, then 6 keys with 3 letters and 2 keys with four. 

How define the groups of letters for each keys ? How easy split digraphs of same letter ?

## NGSL

Using the frequency of letters on NGLS and minimize finger movement for most used words.

## Process

All processing are done using AWK and Bash scripts and common GNU Linux tools.


### the frequencies

The 2809 words of NGSL 1.2 are represented as "lemma fppm", where lemma is the word and fppm is the absolute frequency of lemma per million.

Then for each character the fppm of ocurrences in all lemmas are normalized as absolute percentual, and same process for bigrams, trigrams and tetragrams using space at begin and end, to form the normal use of lemmas. The unused digraphs are listed.

The result frequency tables for letters, digraphs, trigraphs, tetragraphs and for not found digraphs.

### the combinations

After processing, the order of letters from high to lower frequenciesi, in groups of 8, are:

    **e t o a n h i r -- s l d u c b f y -- m w p g v k x j -- q z**.

A logical option for minimize the efforts is combine one letter of each group per key, selected with digraphs and trigraphs with lowerest frequencies. ( Using ..... )

The digraphs with first letter from group one _e t o a n h i r_ with second letter from group two _s l d u c b f y_ were selected from the list frequencies of digraphs and complemented witht frequency 0.0 for those inexistent. Then use brute force for select best lower overall combinations.

## Results

Using the initial NGLS list as corpus and counting the ocurrencies as ppm (0.853976) for numeric keyboard, shows:

| design | touchs | layout | 
| -- | -- | -- | 
| full keyboard | 3.30764 | abcdefghijklmnopqrstuvwxyz |
| common layout | 7.02167 | _,@ abc def ghi jkl mno pqrs tuv wxyz * 0 # | 
| design layout | 4.80558 | space afp obg tdx hym euk nlvq icj rswz * 0 # |

Adicional functions are assigned to __* 0 #__

The common layout show a 212.286 % effort over a full keyboard, and the design layout only 145.287 % 

## Lists used

    ngls    ngsl-1.2 

    ngrf    google books n-gram, full

    ngrp    google books n-gram, only > 1

## References

https://newgeneralservicelist/s/NGSL_12_stats.csv

https://newgeneralservicelist/s/NAWL_10_stats.csv


