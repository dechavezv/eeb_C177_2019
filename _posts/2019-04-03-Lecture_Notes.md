---
layout: post
title: " Week 1- Lecture Notes from Wednesday"
description: "Guide to undertand what we did during lecture"
category: articles
tags: [github, Git]
comments: false
---

### Wednesday:
#### [Link to a really cool Shell resource!!!!](https://explainshell.com/)

We learned to change your Hoffman2 password
  * Note that this only works in the login nodes
    * don't remember what that is? Check the notes from Week 1 Monday

~~~
[c177-i0@login3 ~]$ passwd
~~~
{:  .language-bash}
* You will get this prompt

~~~
[c177-i0@login3 ~]$ passwd
~~~
{:  .language-bash}
~~~
Changing password for user c177-i0.
Please enter your current password:
~~~
{:  .output}
* You will need to enter your password, but note that you will not be able to see what you typed.
* If all goes well you will see the following:

~~~
[c177-i0@login3 ~]$ passwd
~~~
{:  .language-bash}
~~~
Changing password for user c177-i0.
Please enter your current password:

Please adhere to the following rules when creating your password:
You cannot use your username or a significant portion of it in your password.
You need to have a minimum of 10 characters.
You need to have at least 5 unique (different) characters.
You need to have at least one character from 3 different character classes.
The character classes are: UPPERCASE CHARACTERS, lowercase characters, digits (0-9),
    and punctuation ((  !#%&)(+*-,/.;=<?>@[]\_^`{}|~  )).
Please enter your NEW password:
~~~
{:  .output}

* I recommend making your password a sassy sentance but that is just me....

* If Hoffman2 accepts your new password it will ask you this:

~~~
Please re-enter your new password:

Password saved.  Strength: very strong.
Please allow up to 15 minutes for your password to propagate to all cluster nodes.
~~~
{:  .output}
~~~
[c177-i0@login3 ~]$
~~~
{:  .language-bash}

* If you type the same password twice, it will be accepted.

---
We learned some navigation in the shell!
* to see what is in the directory you are currently in type (list directory contents)

* If you type

~~~
[c177-i0@n9771 ~]$ ls
~~~
{:  .language-bash}

* Note that I am in a compute node.  If you don't remember what this means see the notes from Week 1 Monday.

* You should see

~~~
[c177-i0@n9771 ~]$ ls
classdata  eeb-177  scratch
~~~
{:  .language-bash}

* `ls` has many useful functions we can check them out by typing the following:

~~~
man ls
~~~
{:  .language-bash}
* type q a few times to exit

* or

~~~
ls --help
~~~
{:  .language-bash}

* here are some useful flags (-letter) that work with `ls`

~~~
 ls -a (hidden)
 ls -R (all files all folders)
 ls -t (last modified)
 ls -S (files size)
 ls -F (shows file type)
 ls -F directory (other directories)
~~~
{:  .language-bash}

* try them out to understand how they different

* if you need more info [check this out](https://explainshell.com/explain/1/ls)

If you want to know where you are (ie the path to the directory you are in) try:

* if you type pwd

~~~
[c177-i0@n2010 ~]$ pwd
~~~
{:  .language-bash}
* it will print the name of current/working directory

~~~
[c177-i0@n2010 ~]$ pwd
/u/home/class/c177/c177-i0
~~~
{:  .language-bash}

What if you want to change directory

* you can do this by using cd

  * cd requires an argument
  * I can find out the directories within my current directory using 'ls'

~~~
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  scratch
~~~
{:  .language-bash}

* if I want to move up a directory into classdata I will type

~~~
[c177-i0@n2010 ~]$ cd classdata
~~~
{:  .language-bash}

* now my shell looks like this

~~~
[c177-i0@n2010 classdata]$
~~~
{:  .language-bash}

* I am no longer in my home directory, I am now in classdata

* Right now classdata looks like this

~~~
[c177-i0@n2010 classdata]$ ls
classdata  Week1
~~~
{:  .language-bash}

* if I want to move back to my home directory I have a couple of options.

  * 1) I can use `$HOME`

~~~
[c177-i0@n2010 classdata]$ cd $HOME
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}

  * 2) I can use `cd ~`

~~~
[c177-i0@n2010 classdata]$ cd ~
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}

  * 3) I can use `../`

~~~
[c177-i0@n2010 classdata]$ cd ../
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}
    * the two dots indicate that I would like to go back one directory

    * note that ../ will only take me back to your home directory if I an one directory above home

  * 4) I can also use the full path to home

~~~
[c177-i0@n2010 classdata]$ cd /u/home/class/c177/c177-i0
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}
* What happens if I try

~~~
[c177-i0@n2010 classdata]$ cd ../../
~~~
{:  .language-bash}

* Where am I now and how to I get back home?

---
Tip to make your life easier: [use tab to complete your path](https://www.howtogeek.com/195207/use-tab-completion-to-type-commands-faster-on-any-operating-system/)
---

Lets make and delete stuff!

* to make a new directory use mkdir

~~~
[c177-i0@n2010 ~]$ mkdir example_dir
~~~
{:  .language-bash}

* I will now have a directory named example_dir

~~~
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  example_dir  scratch
~~~
{:  .language-bash}

* if I include a blank space in my directory name bad stuff happens...

~~~
[c177-i0@n2010 ~]$ mkdir example dir
~~~
{:  .language-bash}
~~~
[c177-i0@n2010 ~]$ ls
classdata  dir  eeb-177  example  example_dir  scratch
~~~
{:  .output}
* I made two directories `example` and `dir`

* I can also make multiple directories in the same go using the flag -p
  * It makes the parent directories for any nested directories
  * I wanted to make and `example_1` directory that contains and `example_A` directory in the directory `example`

~~~
[c177-i0@n2010 ~]$ mkdir -p example/example_1/example_A
~~~
{:  .language-bash}
* I can then cd into example_A and check that I have the path that I expect

~~~
[c177-i0@n2010 ~]$ cd example/example_1/example_A
[c177-i0@n2010 example_A]$ pwd
/u/home/class/c177/c177-i0/example/example_1/example_A
~~~
{:  .language-bash}

Let learn to remove the mistakenly made directories `example` and `dir`, but remember __once it is gone it is really gone__ so be careful.

* there are several ways to remove a directory

* try using rmdir

~~~
[c177-i0@n2010 ~]$ rmdir example
[c177-i0@n2010 ~]$ ls
~~~
{:  .language-bash}
~~~
classdata  dir  eeb-177  example_dir  scratch
~~~
{:  .output}
* you can also use `rm -r`
  * the `-r` stands for recursive (deletes everything in the directory)

~~~
[c177-i0@n2010 ~]$ rm -r dir
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  example_dir  scratch
~~~
{:  .language-bash}

* if you try  this without the `-r` you will get the following

~~~
[c177-i0@n2010 ~]$ rm dir
~~~
{:  .language-bash}
~~~
rm: cannot remove `dir': Is a directory
~~~
{:  .output}

Now lets make a file in example_dir

* we can cd into the directory, then make the file using the command `touch`

~~~
[c177-i0@n2010 ~]$ cd example_dir/
[c177-i0@n2010 example_dir]$ touch example.txt
[c177-i0@n2010 example_dir]$ ls
example.txt
~~~
{:  .language-bash}

* now we have an empty text file with the following path: `/u/home/class/c177/c177-i0/example_dir/example.txt`

* I figured this out by using the command `pwd`

* I can also make this file from my home directory by doing the following

~~~
[c177-i0@n2010 ~]$ touch /u/home/class/c177/c177-i0/example_dir/example.txt
~~~
{:  .language-bash}
* I can use `ls -R` to see that the file `example.txt` is contained in the new example dir directory

~~~
[c177-i0@n2010 ~]$ ls -R
.:
classdata  eeb-177  example  example_dir  scratch

./eeb-177:
Favorite_animal.txt  README.txt  W1-Discussion-In-class.txt

./example:
example_1

./example/example_1:
example_A

./example/example_1/example_A:

./example_dir:
example.txt
~~~
{:  .language-bash}

* it also shows me the contents of the eeb-177 directory made for the discussion exercise and the two directories that we made in directory example

* I am now going to remove the `example.txt` file that I made using rm

* I can cd into example_dir and then delete it

~~~
[c177-i0@n2010 ~]$ cd example_dir/
[c177-i0@n2010 example_dir]$ ls
example.txt
[c177-i0@n2010 example_dir]$ rm example.txt
[c177-i0@n2010 example_dir]$ ls
~~~
{:  .language-bash}

* I can also remove it from my home directory if I know the path to the file

~~~
[c177-i0@n2010 ~]$ rm example_dir/example.txt
[c177-i0@n2010 ~]$ ls
classdata  eeb-177  example  example_dir  scratch
[c177-i0@n2010 ~]$ ls example_dir/
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}

* If I want to be a little safer about using rm I can use the flag `-i`

~~~
[c177-i0@n2010 example_dir]$ ls
example.txt
[c177-i0@n2010 example_dir]$ rm -i example.txt
~~~
{:  .language-bash}
~~~
rm: remove regular empty file example.txt ? y
~~~
{:  .output}
~~~
[c177-i0@n2010 example_dir]$ ls
[c177-i0@n2010 example_dir]$
~~~
{:  .language-bash}

* if it was a mistake to type rm I can say no

~~~
[c177-i0@n2010 example_dir]$ rm -i example.txt
~~~
{:  .language-bash}
~~~
rm: remove regular empty file `example.txt'? n
~~~
{:  .output}
~~~
[c177-i0@n2010 example_dir]$ ls
example.txt
~~~
{:  .language-bash}

---

Lets look at a file

* cd into `~/classdata/Week1/Wednesday_in_class`
  * notice that I am using the `~` for the home directory  

* this directory contains the following:

~~~
[c177-i0@n2010 Wednesday_in_class]$ ls
README.populations               sort_ex_2.txt    uniq_color3.txt
README.populations.modified.txt  uniq_color1.txt  uniq_ex_1.txt
sort_ex_1.txt                    uniq_color2.txt
~~~
{:  .language-bash}

* I can look at the entire contents of these files using `less`

~~~
[c177-i0@n2010 Wednesday_in_class]$ less sort_ex_1.txt
~~~
{:  .language-bash}

* the Shell will show me something that looks like this

~~~
Griffon Bleu de Gascogne
Segugio Italiano
Blue Heeler
Pachon Navarro
Treeing Tennessee Brindle
Ratonero Valenciano
Maltese
Labradoodle
Bruno Jura Hound
Cesky Fousek
Armant
Stabyhoun
sort_ex_1.txt (END)
~~~
{:  .output}

* to get back to the command prompt use `q`

* I can also look at the top ten lines of the file using `head`.  10 lines is the default

~~~
[c177-i0@n2010 Wednesday_in_class]$ head sort_ex_1.txt
Griffon Bleu de Gascogne
Segugio Italiano
Blue Heeler
Pachon Navarro
Treeing Tennessee Brindle
Ratonero Valenciano
Maltese
Labradoodle
Bruno Jura Hound
Cesky Fousek
[c177-i0@n2010 Wednesday_in_class]$
~~~
{:  .language-bash}

* I can look at any number of lines using the flag `-n`

~~~
[c177-i0@n2010 Wednesday_in_class]$ head -n 3 sort_ex_1.txt
Griffon Bleu de Gascogne
Segugio Italiano
Blue Heeler
[c177-i0@n2010 Wednesday_in_class]$
~~~
{:  .language-bash}

* `-n 3` printed only the first three lines

* `tail` will show me the bottom ten lines (by default)

~~~
[c177-i0@n2010 Wednesday_in_class]$ tail sort_ex_1.txt
Blue Heeler
Pachon Navarro
Treeing Tennessee Brindle
Ratonero Valenciano
Maltese
Labradoodle
Bruno Jura Hound
Cesky Fousek
Armant
Stabyhoun[c177-i0@n2010 Wednesday_in_class]$
~~~
{:  .language-bash}

* I can also use the `-n` flag with tail

~~~
[c177-i0@n2010 Wednesday_in_class]$ tail -n 2 sort_ex_1.txt
Armant
Stabyhoun[c177-i0@n2010 Wednesday_in_class]$
~~~
{:  .language-bash}

* Note that the command prompt is on the same line as the last line of the file.  This is because I did not add a new line to the end of my file.

---

Lets build a directory

* In `~/classdata/Week1/Monday_in_class` there is a file called `Do_first_Build_directory_exercise.txt`   

* this file contains

~~~
[c177-i0@n2010 Monday_in_class]$ head ~/classdata/Week1/Monday_in_class/Do_first_Build_directory_exercise.txt
~~~
{:  .language-bash}
~~~
lecture_1
└── syllabus
    ├── full_document
    └── partial_document


[c177-i0@n2010 Monday_in_class]$
~~~
{:  .output}

* Build this directory structure from your home directory

* There are many ways to do this.

* here is one example

~~~
[c177-i0@n2010 Monday_in_class]$ mkdir -p $HOME/Lecture_1/syllabus/full_document
[c177-i0@n2010 Monday_in_class]$ mkdir -p $HOME/Lecture_1/syllabus/partial_document
~~~
{:  .language-bash}

* I can check it is in home using `ls -R`

~~~
[c177-i0@n2010 Monday_in_class]$ ls -R $HOME
/u/home/class/c177/c177-i0:
classdata  eeb-177  example  example_dir  Lecture_1  scratch

/u/home/class/c177/c177-i0/eeb-177:
Favorite_animal.txt  README.txt  W1-Discussion-In-class.txt

/u/home/class/c177/c177-i0/example:
example_1

/u/home/class/c177/c177-i0/example/example_1:
example_A

/u/home/class/c177/c177-i0/example/example_1/example_A:

/u/home/class/c177/c177-i0/example_dir:
example.txt

/u/home/class/c177/c177-i0/Lecture_1:
syllabus

/u/home/class/c177/c177-i0/Lecture_1/syllabus:
full_document  partial_document

/u/home/class/c177/c177-i0/Lecture_1/syllabus/full_document:

/u/home/class/c177/c177-i0/Lecture_1/syllabus/partial_document:
[c177-i0@n2010 Monday_in_class]$
~~~
{:  .language-bash}

* I could have also done this  

~~~
[c177-i0@n2010 Monday_in_class]$ cd ~
[c177-i0@n2010 ~]$ mkdir Lecture_1
[c177-i0@n2010 ~]$ cd Lecture_1/
[c177-i0@n2010 Lecture_1]$ mkdir full_document
[c177-i0@n2010 Lecture_1]$ mkdir partial_document
~~~
{:  .language-bash}

* I can think of several other ways to accomplish this task


* Can you make a file structure from `Lecture_1` that looks like this and contains a file?

~~~
lecture_1
└── folders_for_file
    └── folder_A
          |── folder_A.1
          |── folder_A.2 -- file_for_folder_A.2.txt
          └── folder_A.3
~~~
{:  .output}

---

Copying files between directories

* Use the command `cp`.  It works like this
  * `cp <path of the file to move> <path to directory where you want it>`

* lets move the file `syllabus.txt` from the directory `~/classdata/Week1/Monday_in_class` and move it to the directory `~/Lecture_1/syllabus/full_document`

~~~
[c177-i0@n2010 ~]$ cp ~/classdata/Week1/Monday_in_class/syllabus.txt ~/Lecture_1/syllabus/full_document/
[c177-i0@n2010 ~]$ ls ~/Lecture_1/syllabus/full_document/
syllabus.txt
[c177-i0@n2010 ~]$
~~~
{:  .language-bash}

* now I can look at the contents of the file

~~~
[c177-i0@n2010 ~]$ head ~/Lecture_1/syllabus/full_document/syllabus.txt
~~~
{:  .language-bash}
~~~
# __Practical Computing for Evolutionary Biologists and Ecologists Syllabus; EEB C177/C234__
Course Basic Information |  Course Logistics  
--- | ---
__Spring 2019__ <br> __Letter grading__ <br>  __Units:__ 4 <br> __Prerequisite:__ Life Sciences 1 or 7B. | __Lecture:__ MW 8-9:15; Physics and Astronomy Building Room 2748 <br>  __Computer Lab:__ T or R 1-2:50; WGYoung 4067 <br> __Course Website:__ <br> __Github classroom:__ <br> https://classroom.github.com/classrooms/47793618-pceeb-practical_computing_sp2019

____
## Instructor: Emily Curd <br>
eecurd@g.ucla.edu<br>
__Office Hours:__ MW 9:30-10:30 Music School Café
<br> The best way to contact me is by email or through the course GitHub.
[c177-i0@n2010 ~]$
~~~
{:  .output}

---

# Wednesday Challenge

Move these documents into ~/Lecture_1/syllabus/partial_documents:
* final_project.txt                        
* Lab_assignments_participation.txt
* Homework.txt                           
* In_class_Participation.txt
