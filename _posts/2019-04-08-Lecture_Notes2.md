---
layout: post
title: " Week 2- Lecture Notes from Monday Part II"
description: "Guide to undertand what we did during lecture"
category: articles
tags: [github, Git]
comments: false
---

# What You Should Know From Lecture: Week 2

### Monday pt 2:
---

Text editors in the shell!

You nave all used 'nano', but lets just see what it does.

Remember that you can make an empty file using 'touch'. First make a directory in week2_monday called file_test and cd into it.

```
[c177-i0@n2010 file_test]$ touch test.txt
[c177-i0@n2010 file_test]$ ls
test.txt
[c177-i0@n2010 file_test]$ rm test.txt
[c177-i0@n2010 file_test]$ ls
[c177-i0@n2010 file_test]$
```

Lets use nano to make test.txt

```
[c177-i0@n2010 file_test]$ nano test.txt
```
The empty file looks like this

```
GNU nano 2.0.9                           File: test.txt                                                              


















^G Get Help        ^O WriteOut        ^R Read File	 ^Y Prev Page       ^K Cut Text        ^C Cur Pos
^X Exit            ^J Justify         ^W Where Is        ^V Next Page       ^U UnCut Text      ^T To Spell
```

On Hoffman2, if you exit '^X' (control X) before writing any text, the file will not exist.

Try it again but this time add any thing, even a single space will create the file. Now when you exit (^X), nano will ask you to save changes (y/n), then it lets you know it is updating the file (but you can change the file name here if you want), and the you exit out of nano.

```
[c177-i0@n2010 file_test]$ nano test.txt
[c177-i0@n2010 file_test]$ ls
[c177-i0@n2010 file_test]$ wc -l test.txt
1 test.txt
```

Try opening test.txt in nano and adding five words across 2 lines. After you type ^X same this to a new file called this new file test_add.txt

The result should be something similar to the following:

```
[c177-i0@n2010 file_test]$ nano test.txt
[c177-i0@n2010 file_test]$ ls
test_add.txt  test.txt
[c177-i0@n2010 file_test]$ wc *
 2  5 26 test_add.txt
 1  0  3 test.txt
 3  5 29 total
[c177-i0@n2010 file_test]$ head test_add.txt
one two three
four five  
[c177-i0@n2010 file_test]$
```
There are other more complicated text editors available in the shell.  Feel free to check them out: [emacs](https://www.gnu.org/software/emacs/) and [vi](https://www.ccsf.edu/Pub/Fac/vi.html)

---

There are other ways to make files. Lets try 'echo' first and 'printf' second.

```
[c177-i0@n2010 file_test]$ echo "I love dogs"
I love dogs
```
'echo' display a line of text.  We can redirect that text to a file...

```
[c177-i0@n2010 file_test]$ echo "I love dogs" > dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
```
'printf' does something similar. It formats and print data

```
[c177-i0@n2010 file_test]$ printf "cats are ok too"
cats are ok too[c177-i0@n2010 file_test]$
```
To get a newline we need to add the newline character '\n'

```
[c177-i0@n2010 file_test]$ printf "cats are ok too\n"
cats are ok too
```
We can redirect this text to a text file using '>>'

```
[c177-i0@n2010 file_test]$ printf "cats are ok too" >> dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
cats are ok too[c177-i0@n2010 file_test]$
```
but don't for get '\n'

```
[c177-i0@n2010 file_test]$printf "cats are ok too\n" >> dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
cats are ok toocats are ok too
```

__Note__: we used '>>' rather than '>' and it added text to the end of the previous file text.

Lets add some more stuff.

```
[c177-i0@n2010 file_test]$ echo "I love dogs" >> dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
cats are ok toocats are ok too
I love dogs
[c177-i0@n2010 file_test]$ printf "cats are ok too\t" >> dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
cats are ok toocats are ok too
I love dogs
cats are ok too	[c177-i0@n2010 file_test]$
```

We added a '\t' to the 'printf' statement and it added a tab.

```
[c177-i0@n2010 file_test]$ printf "cats are ok too\n" >> dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
cats are ok toocats are ok too
I love dogs
cats are ok too	cats are ok too
[c177-i0@n2010 file_test]$
```
What happens if we add text with a '>'

```
[c177-i0@n2010 file_test]$ echo "I love dogs" > dogs.txt
[c177-i0@n2010 file_test]$ head dogs.txt
I love dogs
```

---

# Monday pt 2 Challenge

Download a SFTP client and upload a text file from your computer/device to the folder /week2_monday/file_test
