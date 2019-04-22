---
layout: post
title: " Week 4- Regular expressions with sed "
description: "Guide to undertand regular expression"
category: articles
tags: [github, Git]
comments: false
---
Goals:
- Understand the power of regular expressions.
- Understand the things that sed can do with expressions.
- Change the format of real data from biological experiments using regular expressions.

# Regular expressions (regex) and more sed

In the last discussion we learned that `sed` can be used to 
replace characters with a tab - e.g.`sed`.  
What you were doing was using __regular expressions (regex)__ - searching for and matching a specific string(s) 
of characters- and replacing the regular 
expression with with the desired character using sed. 
You can also do this with `awk` and `grep` and a million 
(might be an exaggeration) other commands and programming languages. 
_Note:_ regex can vary slightly between commands and programming languages.

Today we will learn more about regex using [sed](http://www.grymoire.com/Unix/Sed.html). <- that link leads to an amazing sed tutorial.  The website has late 90's style, but the info is really very good.

---
#### Letters:

With sed we can replace or delete some characters. Lets supose we have 
the expression `Pp132` and we want to print only numbers `123`. We could do the 
job just by replacing the letter with noting. Like this:  

~~~
[c177-t0@n9917 ~]$ echo "Pp132" | sed 's/[P][p]//'
~~~  
{:  .language-bash}
~~~
123
~~~

In the code above `[ ]` means a single character. Also, 
because we used `sed` and we added nothing to replace 
the match pattern we only returned 132.

The code above worked for that particular expresion but wont do the job for other 
expressions like `Bb132` or this `Aa123` or `Dd123`,etc.  
~~~
[c177-t0@n9917 ~]$ echo "Bb132" | sed 's/[P][p]//'
~~~
{:  .language-bash}
~~~
Bb132
~~~
~~~
[c177-t0@n9917 ~]$ echo "Aa132" | sed 's/[P][p]//'
~~~
{:  .language-bash}
~~~
Aa132
~~~
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[P][p]//'
~~~
{:  .language-bash}
~~~
Dd132
~~~ 

This is were regex become a poweful tool. Using regex 
we can specify that we only want to match lowercase letters [a-z], 
uppercase letters [A-Z] or both upper and lowercase letters [a-zA-Z]. Thefore, we can use a single command that works with diferent inputs.  

~~~
[c177-t0@n9917 ~]$ echo "Bb132" | sed 's/[A-Za-z][A-Za-z]//'
~~~
{:  .language-bash}
~~~
132
~~~
~~~
[c177-t0@n9917 ~]$ echo "Aa132" | sed 's/[A-Za-z][A-Za-z]//'
~~~
{:  .language-bash}
~~~
132
~~~
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[A-Za-z][A-Za-z]//'
~~~
{:  .language-bash}
~~~
132
~~~

In regex the `&` means the characters that were matched. We can try this instead

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[A-Za-z][A-Za-z]/&/'
~~~
{:  .language-bash}
~~~
Dd132
~~~
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[A-Za-z][A-Za-z]/&&&/'
~~~
{:  .language-bash}
~~~
DdDdDd132
~~~

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[A-Za-z][A-Za-z]/&\t&\t&/'
~~~
{:  .language-bash}
~~~
Dd	Dd	Dd132
~~~

__The tab `\t` does not always work in sed regular expressions!__ If you cannot make it work try the following `'$'\t` in place of `\t`

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[A-Za-z][A-Za-z]/&'$'\t&'$'\t&/'
~~~
{:  .language-bash}
~~~
Dd      Dd      Dd132
~~~

What happens if we do the following:
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[AZaz][AZaz]//'
~~~
{:  .language-bash}
~~~
Dd132
~~~
_Nothing..._  because we matched only AZaz.  The `-` tells regex that you are looking for a range of characters from A-Z or a-z. When you ommit `-` that will tell regex to look 
only for the characters in the `[ ]` which in this case are `A` , `Z` ,`a` and `z`.  

---

### Numbers

Let's try the same with numbers.  We will add a tab after the letters and repeat the pattern 2 times:

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[0-9][0-9][0-9]/\t&&/'
~~~
{:  .language-bash}
~~~
Dd 132
~~~

We can also match just the first number but not replace it. In other words, we can delete the 
first number

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[0-9]//'
~~~
{:  .language-bash}
~~~
Dd32
~~~
{:  .language-bash}

If we do the following:

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[023]//'
~~~
{:  .language-bash}
~~~
Dd12
~~~
{:  .language-bash}
We only have the 3 replaced, why?  
Well is was the first number that matched [023].  If we do this we replace both the 3 and the 2.
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/[023][023]//'
~~~
{:  .language-bash}
~~~
Dd1
~~~
---

We can use the `.` as a wild card for any character. 
Let's matched the `D` with a wildcard. Since `.` will macth the first character we can type:  

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/.//'
~~~
{:  .language-bash}
~~~
d132
~~~
{:  .language-bash}

Here will match `D` and `d`.
~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/..//'
~~~
{:  .language-bash}
~~~
132
~~~

There is way to search for multiple characters that match a pattern and that 
is with `.` followed by a `*`.

~~~
[c177-t0@n9917 ~]$ echo "Dd132" | sed 's/.*//'
~~~
{:  .language-bash}

What `*` is doing above is matching all `.` until it finds the end of a line. Thefore, all characters 
were matched and replaced.   

If you want use regex for an actual period you need to use the escape `\.` For example:

~~~
[c177-t0@n9917 ~]$ echo "Dd.132" | sed 's/.*\.//'
~~~
{:  .language-bash}
~~~
123
~~~

The .* search ended at the \. We can grab both sides of the match with:

~~~
[c177-t0@n9917 ~]$ echo "Dd.132" | sed 's/.*\..*//'
~~~
{:  .language-bash}
---
#### Anchor your regular expressions with ^ and $

`^` means that you are looking for only a match at the beginning of the line. For example:
~~~
echo "Dd.132" | sed 's/^.*\.//'
~~~
{:  .language-bash}
~~~
c132
~~~
{:  .language-bash}
vs
~~~
[c177-t0@n9917 ~]$ echo "Dd.132" | sed 's/\..*$//'
~~~
{:  .language-bash}
~~~
Dd
~~~
---

#### Keeping part of the pattern (different than &)

If you have a phrase like "African wild dogs rule" you can use regex to rearrange the phrase to "wild dogs rule Africa" using escaped ().

~~~
[c177-t0@n9917 ~]$ echo "African wild dogs rule" | sed 's/\(Africa\)n \(wild dogs rule\)/\2 \1/'
~~~
{:  .language-bash}
~~~
wild dogs rule Africa
~~~

In this case we used `\(` and `\)` around the text that we wanted to keep. 
 We then called them using `\1` and `\2`.  If we want to keep the phrase "wild dogs rule" 
we could do the following:

~~~
[c177-t0@n9917 ~]$ echo "African wild dogs rule" | sed 's/\(Africa\)n \(wild dogs rule\)/\2/'
~~~
{:  .language-bash}
~~~
wild dogs rule
~~~

# Mini-challenge

In a file called `Week3_mini-challenge<your.initials>.sh` save the 
`echo` and `sed` commands that give you the following **Input** and **Output** combinations:

1.  
Input: Cats eat 5 billion birds a year  
Output: 5 billion? 5 billion!  
_note: white spaces are single spaces_  

2.  
Input: 12345abcde678910fghij  
Output: abcdefghij12345678910  

3.  
Input: 12345abcde678910fghij  
Output: ab  cd  ef  gh  ij  12  34  56  78  91  0  
_note: white spaces are tabs_  

4.
Input: 12345abcde678910fghij
Output: ab  cd  ef  gh  ij
_note: white spaces are tabs_

To **SUBMIT** your Mini-challenge, `push` your file `Week3_mini-challenge<your.initials>.sh` to this Github 
[repository](https://classroom.github.com/a/eQ6KnMOT)  
***Note***:replace `<your_initials>` with your actual name  

---

#### Sed again...

You can use multiple sed commands at the same time.
~~~
[c177-t0@n9917 ~] echo "dogs1cats1dogs2cats2" | sed 's/dogs1//' | sed 's/cats2//'
~~~
{:  .language-bash}
~~~
cats1dogs2
~~~
or you can use the `-e flag`

~~~
[c177-t0@n9917 ~]$ echo "dogs1cats1dogs2cats2" | sed -e 's/dogs1//' -e 's/cats2//'
~~~
{:  .language-bash}
~~~
cats1dogs2
~~~
You also learned last time that you can replace multiple instances of a match using the global replacement as follows:
~~~
[c177-t0@n9917 ~]$ echo "dogs1cats1dogs2cats2" | sed -e 's/dogs/sgod/g' -e 's/cats/stac/g'
~~~
{:  .language-bash}
~~~
sgod1stac1sgod2stac2
~~~
When using global replacement you might also find it useful to use 
anchors for your regular expressions.  `^` anchors your search to 
the beginning of the file.  `$` anchors your search to the end of the file.  

~~~
[c177-t0@n9917 ~]$ echo "dogs1cats1dogs2cats2" | sed -e 's/^dogs/sgod/g' -e 's/cats/stac/g'
~~~
{:  .language-bash}
~~~
sgod1stac1dogs2stac2
~~~
_notice_ that the second instance of dog was not modified.

~~~
[c177-t0@n9917 ~]$ echo "dogs1cats1dogs2cats2" | sed -e 's/2$/two/g'
~~~
{:  .language-bash}
~~~
dogs1cats1dogs2catstwo
~~~
_notice_ that only the 2 at the end was changed to two

# Challenge

You are given a DNA sequence file in 
[fasta](https://en.wikipedia.org/wiki/FASTA) format.  It has the following features:

```java
>gi_EU254776;tax=d:Fungi,p:Ascomycota,c:Sordariomycetes,o:Diaporthales,f:Gnomoniaceae,g:Gnomonia;
TCATTGCTGGAACAAACGCCCTCACGGGTGCTGCCCAGAAACCCTTTGTGAATACTACCTAAAATGTTGCCTCGGCAGTG
>gi_FJ711636;tax=d:Fungi,p:Basidiomycota,c:Agaricomycetes,o:Agaricales,f:Marasmiaceae,g:Armillaria;
GGAAGGATCATTATTGAAACTTGAATCGTAGCATTGAGAGCTGTTGCTGACCTGTTAAAGGTATGTGCACGCTCAAAGTG
```

* The `>` followed by text indicates the name and information for a DNA sequence  
		* In this case, the read name is the alpha-numeric following the `>gi_`.  The taxonomic ranks for the thing sequenced are indicated by the letter d = domain, p = phylum, c = class, o = order, f = family, and g = genus.
* The following line of AGTCs indicate the DNA sequence
* In the example above, you are given 2 DNA sequences.

__For this challenge__, you want to extract the taxonomic information for each read in a specific format and you do not want to include the DNA sequences.  The specific format that you need resembles the following:
~~~
EU254776	Fungi;Ascomycota;Sordariomycetes;Diaporthales;Gnomoniaceae;Gnomonia
FJ711636	Fungi;Basidiomycota;Agaricomycetes;Agaricales;Marasmiaceae
~~~
***Note**: Spaces above refers to tabs

For this challenge you will need to do the following:  
1. make a copy of the data file `~/classdata/Labs/Lab4/rdp_its.90_test.fasta` and put it into a new directory in your home for Lab_4.  
2. Grab only the lines of the `rdp_its.90_test.fasta` file that include the sequence 
name (__hint__ you will probably not want to use sed).  
3. Use sed to reformat each line so that it 
resembles the specific format indicated 
above (__hint__ not all of the lines will have six taxonomic ranks).  
4. Save the information with the format indicated as `challenge_regex_sed_<your_initials>.txt`
5. To **SUBMIT** your challenge `push` your file `challenge_regex_sed_<your_initials>.txt` to this Github 
[repository](https://classroom.github.com/a/eQ6KnMOT)  
***Note***:replace `<your_initials>` with your actual name






