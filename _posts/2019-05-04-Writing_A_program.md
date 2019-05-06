---
layout: post
title: " Week 6- Writing a program "
description: "Guide to wirtie a program with Python"
category: articles
tags: [github, Git]
comments: false
---

Goals:
- Understand the importance of building a program 
- Learn how to gather user input into the program.
- Learn how to process files in sequence using for loop.
- Understand the importance of using variables instead of fixed values.
- Learn how to give warnings and feedback to the user.

## Getting the text editor and input files.

Open a terminal, **DO NOT** Login into HOFFMAN. Navigate to your Desktop with cd ~/Desktop/. 
Then create a folder called C177_Week6 and navigate to this folder. 
Once you are located into the folder you just created, transfer the files 
corresponding to lab6 from Hoffman to the current directory.  

For **mac users** you can type: 
~~~
scp c177-t0@hoffman2.idre.ucla.edu:/u/home/class/c177/c177-t0/classdata/In_class/Week6/* ./
~~~ 
***Note***: change `c177-t0` by your own user name in Hoffman. Change also the path origin with your own username.

For **PC users** you can use [cyberduck](https://cyberduck.io/download/) or [putty](https://www.hoffman2.idre.ucla.edu/access/putty/) to transfer file from `c177-t0@hoffman2.idre.ucla.edu:/u/home/class/c177/c177-t0/classdata/In_class/Week6` to your Desktop.  
***Note1***: change the path origin with your own username.  
***Note2***: If you cannot acess to your Desktop through the terminal because you are using 
`chrome ssh`. You can work in hoffman but you will need [cyberduck](https://cyberduck.io/download/) 
to edit your file. Otherwise you can just use nano from hoffman. For future exercise it may be ideal to 
install [putty](https://www.hoffman2.idre.ucla.edu/access/putty/) in your computer.  

Also, for the first part of the class you need to open a text editor. You can use `TextWrangler` (get it from the app store) for **mac users**
and [notepad](https://www.microsoft.com/en-us/p/notepad-for-windows-10/9nblggh4w20k?activetab=pivot:overviewtab) for **pc users**. Also you can try [atom](https://atom.io).   
A text editor is just a nice tool that allows you to write code in a pretty nice way.  

Open a new blank file with your text editor and save it as `Mergefiles.py`. Also make sure that is executable by 
typing the following:

~~~
$ chmod 777 Mergefiles.py
~~~

## Writing a program that read’s more than on file.

In this class, we are going to build a program that takes a list of documents specified by the user. 
Then, we will write codes in `python` that extract values from those files and combined them into a single master 
file. 

## Recognizing user input with python

The first part of this program will be a way for getting user input by passing 
arguments when the program is launched. You have already been using command-line 
arguments with other program, such as ls. For example:

~~~
ls -l LED*
~~~

The code above passes the arguemnt  `-l` and `*.txt` to the ls command.

In python, user input arguments are accessed through the `sys.argv` variable, which is provided via the sys module. This is pretty similar to ‘$1’ in bash.

Before we understand how this works. We need to open a text editor. In this discussion we will use `TextWrangler` for macs and notepad for `pcs`. A text editor is just a nice tool that allows you to write code in a pretty interface.

Open your text editor and enter these lines into your blank  Mergefiles.py script

```python
#!/usr/bin /env python
import sys
for MyArg in sys.argv:
print MyArg
```

Once import the sys module in you script, you have access to the sys.argv variable. This variable is a Python list of arguments sent to the program when the user executes it. It provides a way to pass data from the command-line world to the Python world.

Save the file and run in the terminal window. 

~~~
$ Mergefiles.py 
~~~

~~~
Mergefiles.py
~~~

Interesting! Eve thought you didn’t pass any arguments to ` Mergefiles.py` the `sys.arv` variable was not empty. This is because the zeroth element of the when you use arguments in Python. In other words, don’t assume that the first argument you have passed to the program on the command line is the first argument you have passed to the program on the command line is the first argument you have passed to the program on the command line is the first argument. Try running  Mergefiles.py again, and add some arguments of your own:

~~~
$ Mergefiles.py first secod “third and fourth”
~~~
~~~
$ Mergefiles.py
first
second
“third and fourth”
~~~

As you can see, each argument was separated by a space on the command line and each was brought into the program as a string. If you want to include spaces as part of an argument, therefore, you need to either surround it with quotes, or escape each with a backslash. It’s also important to know that if you redirect the output of the program to the file using` >` , the command-line text from > onward is not included in the program.

So far this is pretty straightforward:
~~~
$ Mergefiles.py LED*.txt
~~~

~~~
LEDBlue.txt
LEDGreen.txt
LEDRed.txt
LEDYellow.txt
~~~

Notice that the file list is returned in alphabetical order here. 

## Converting arguments to a file list

Here you will take advantage of the shell’s ability to give us a file list, 
and you will operate on each of these files. First, add a bit of user interface 
robustness to your program by checking to make sure an argument has been given. 
If there is only one argument - the name of the program, which is always the 
first (that is, zeroth) element of the `sys.argv` list: then you will 
print out some text describing how the program should be used. Lets try this:

```python
#!/usr/bin/env python

Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.

Usage:
	Mergefiles.py  *.txt > combinedfile.dat
"""

import sys

if len(sys.argv)<2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList: # statements done once per file
	print InfileName
```

If we don’t provide any input the result will be our comment define as our `Usage` variable:  

~~~
$ python Mergefiles.py
~~~

~~~
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
        Mergefiles.py *.txt > combinedfile.dat
~~~

Now let’s provide some input to our program. Run it with `Mergefiles.py  LED*` :

~~~
$ python Mergefiles.py LED*
~~~

~~~
LEDBlue.txt
LEDGreen.txt
LEDRed.txt
LEDYellow.txt
~~~

Notice that in our program additional information sent to the file 
begins at the second element of `sys.argv`. When coding, you can access the 
arguments from this second element to the end of the list by using the index number 
followed by a colon alone: `sys.argv[1:]`

## Providing feedback with sys.stderr.write ( )

Our program is designed to be used with the redirect operate `>` rather than by 
opening and writing to the destination file. 
The advantage of this approach is that it gives the user the 
ability to see the output, make sure it is what was expected, 
and then choose an appropriate filename in which to store the result. 
However, a problem with this approach is that our current `print InfileName` 
that specify the input files that the user has specified, will be also include in the output.  Try it:

~~~
$ python Mergefiles.py LED* > Output.txt
$ less Output.txt
LEDBlue.txt
LEDGreen.txt
LEDRed.txt
LEDYellow.txt
~~~

This information can be used as a feedback to user when the program is running. 
However, including this in the output can complicate downstream analyses, 
since such information would likely need to be removed before further work with the file.

You can solve this by sending this information to the screen instead of the output. 
The way you do this in python is by adding the following line:

```python
sys.stderr.write("Processing file %s\n" % (FIleName))
```

The `sys.stderr.write()` stament, like the file-related `.write()` statement, 
takes a string as a parameter and write it as-is. If you want a line ending you have 
to add it yourself. You can build up a string from multiple pieces of data 
using the formatting operate `%` to convert and insert values, as shown here, 
or through string, addition-that is , joining strings with `+`. Unlike the print statement, 
you cant’s mix integers and strings without converting the integers with the `str()` function `%` operate. 

Let’s substitute the `sys.stderr.write()` command in place of the print stamen in our loop, where it current print InfileName. Your script should look like this:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
	python Mergefiles.py *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList:
	sys.stderr.write("Processing file %s\n" % (FIleName))
```

Now let’s runt the script again and see what is different

~~~
$ python script.py LED* > Output.txt
~~~

After this, the list of files will still appear on the screen, 
but you can notice the difference it you look into the output:

~~~
$ less Output.txt
~~~

Now the information about the list of files is not being written to a file 
if you redirect the output `>`. This is a good way for the program to provide 
feedback on its status, without causing to go back and comment out these diagnostic 
stamens when you are really ready to use it.

## Looping through the file list

So far we have a for loop that cycles through the filenames and prints each one. 
Now lset’s insert some code for the file opening, reading, and output into this loop.

Before doing this you always have to make sure that you understand everything the 
program needs to do with each file. In our case, It should open the file and read 
in the lines skipping the header line. If this is the first file, you will create 
a list variable containing the 1st and 2nd column from each line. 
Then we will append only the 2nd column of the other files to the corresponding 
line of text from the first file, separated by a tab. Once the master list has been created, 
we will print it out.   

**Important** For this program to work correctly, each file must have data that 
correspond line by line. In other words, at list one column should have the same 
characters in all files (e.g species names).

Now lest include the code to accomplish this task:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
	python Mergefiles.py *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList:
		sys.stderr.write("Processing file %s\n" % (InfileName))
	FileNum=0
	MasterList=[]
	for InfileName in FileList:
		# use the name of the file (w/o extension) as the column Header
		Infile = open(InfileName, 'r') # it's ok for this to be in the file loop
		# the line number within each file, resets for each file
		LineNumber = 0 # reset for each file
		RecordNum = 0
		for Line in Infile: # A in figure
			if LineNumber > 0: # skip first Line and blanks
				Line=Line.strip('\n')
				if FileNum==0:
					MasterList.append(Line)
				else:
					ElementList=Line.split('\t')
					MasterList[RecordNum] += "\t" + ElementList[1]
					RecordNum+=1
		LineNumber+=1
		FileNum += 1 # the last statement in the file loop
```

Before we run the program lets understand the different lines of codes here. 
The most important thing to understand here is what happens to `MasterList` 
while reading the first file versus what happens when reading subsequent files. 
Before opening any files, MasterList is given the intitial value of an empty list, 
as indicated by the brackets []. 
This tells the program that the variable is going to be treated as a list of some sort. 
The first time through the file loop, each line that is read in is append to the end 
of `MasterList`, creating a list of string. 
After the first five data lines, the list would look like this.

~~~
[
‘350.12\t4’ ,
‘350.48\t8’ ,
‘350.85\t3’ ,
‘351.12\t11’ ,
‘351.58\t13’ 
]
~~~

The values in this list correspond to those from the first and second column 
of the first file provided by the user (LEDBlue.txt in our case). 
Then with later files, FileNum is greater than 0, 
the code under the else stamen will be executed instead. 
This code is the following:  

```python
else:
	ElementList=Line.split('\t')
	MasterList[RecordNum] += "\t" + ElementList[1]
	RecordNum+=1
```

The first line of the code above will is split the line which has been read from the file 
at each tab, and put into the variable ElementList:

~~~
[‘350.12’,’9’]
~~~

Notice that the first element of this file has already been stored in the MasterList, 
so we only want to grab the second element, which has an index of 1 
(remember that in python index start from 0). 
Then we want to Add a tab before this item and add it onto the corresponding line of 
`MasterList`. We can acomplish this with:   

~~~
MasterList[RecordNum] += "\t" + ElementList[1]
~~~

Remember that MasterList has alredy been define the first time through the loop. 
Therefore, the ouput of this line of code will be:

~~~
`350.12\t4\t9`
~~~

In the list above the second element of file number 2 (LEDGreen.txt) was added to the 
corresponding line of the first file (LEDBlue.txt). Then, to keep track of 
what record in MasterList corresponds to the line currently being parsed, we use the 
RecordNum variable, which is rest for each file and increments each time trough the loop. 

~~~
RecordNum+=1
~~~

The code above is used as index to indicate the appropriate record, 
based on the list that was built the first tie trough the loop. 

Before beginning to read in values from the third file, `RecorNum` is reset to 0 so 
that it starts over at the first item in `MasterList`. Once the file loop is completed, 
the items in `MasterList` will tool like this:

~~~
[‘350.12\t4\t9\t13\t8’ ,
‘350.12\t8\t9\t11\t7’ ,
‘350.12\t3\t12\t12\t4’ ,
‘351.12\t11\t12\t10\t5’ ,
‘351.12\t13\t7\t14\t8’ ,
]
~~~

Now that we understand the different components of our script lests run it.

~~~
$ python Mergefiles.py LED* 
Processing file LEDBlue.txt
Processing file LEDGreen.txt
Processing file LEDRed.txt
Processing file LEDYellow.txt
~~~

Nothing happened !!! But why ??? To see the long list of elements from the three diferent unput
files, we have to add a print `MasterList` statement at the end. Like this:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
        python Mergefiles.py  *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList:
		sys.stderr.write("Processing file %s\n" % (InfileName))
	FileNum=0
	MasterList=[]
	for InfileName in FileList:
		# use the name of the file (w/o extension) as the column Header
		Infile = open(InfileName, 'r') # it's ok for this to be in the file loop
		# the line number within each file, resets for each file
		LineNumber = 0 # reset for each file
		RecordNum = 0
		for Line in Infile: # A in figure
			if LineNumber > 0: # skip first Line and blanks
				Line=Line.strip('\n')
				if FileNum==0:
					MasterList.append(Line)
				else:
					ElementList=Line.split('\t')
					MasterList[RecordNum] += "\t" + ElementList[1]
					RecordNum+=1
			LineNumber+=1
		FileNum += 1 # the last statement in the file loop
print(MasterList)
```

Notice the new line with the print statement at the end. 
Now if you run the program again you will see the whole MasterList:  

~~~
$ python Mergefiles.py LED*
~~~

~~~
['350.12\t4\t9\t13\t8', '350.48\t8\t9\t11\t7', '350.85\t3\t12\t12\t4', '351.21\t11\t12\t10\t5', '351.58\t13\t7\t14\t8', '351.94\t12\t12\t13\t8', '352.30\t4\t8\t10\t15', '352.67\t8\t11\t13\t14', '353.03\t10\t8\t12\t13', '353.40\t11\t7\t12\t9', '353.76\t6\t9\t9\t7', '354.12\t11\t11\t12\t13', '354.49\t11\t9\t12\t12', '354.85\t11\t12\t10\t10', '355.22\t16\t13\t10\t6', '355.58\t11\t14\t11\t5', '355.94\t9\t8\t13\t11', '356.31\t14\t9\t12\t12', '356.67\t9\t13\t13\t9', '357.03\t10\t12\t11\........
~~~

Everything is working!!! So far we manage to combined the three different files into a 
single list called `MasterList`. However, this is not a pretty output. 
In the next section I will teach you how to create an output that you can latter use 
in downstream analysis.  

### Printing the output and generating a header line 
Once the files have been processed, generating ouput is simply a matter of looping 
through the times in the `MasterList`:

```python
for Item in MasterList:
	print Item
```

Lest erase the `print(MasterList)` and add the code above. Remember that this new piece of 
code has to be indetend to the dame level as the file-reading for loop, 
so that it remains inside the first else stamen-meaning that the user entered 
more than 0 arguments upon execution. The code should look like this:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
        python Mergefiles.py *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList:
		sys.stderr.write("Processing file %s\n" % (InfileName))
	FileNum=0
	MasterList=[]
	for InfileName in FileList:
		# use the name of the file (w/o extension) as the column Header
		Infile = open(InfileName, 'r') # it's ok for this to be in the file loop
		# the line number within each file, resets for each file
		LineNumber = 0 # reset for each file
		RecordNum = 0
		for Line in Infile: # A in figure
			if LineNumber > 0: # skip first Line and blanks
				Line=Line.strip('\n')
				if FileNum==0:
					MasterList.append(Line)
				else:
					ElementList=Line.split('\t')
					MasterList[RecordNum] += "\t" + ElementList[1]
					RecordNum+=1
			LineNumber+=1
		FileNum += 1 # the last statement in the file loop
	for Item in MasterList:
		print Item
```

Notice that in the code above we delete the previous statement 
`print(MasterList)` and add the new code into the last two line of our program.  

Now if you run the program again. You will have a nice ouput that you can store into a new file. 
Like this:

~~~
python Mergefiles.py LED* > Ouput.txt
Processing file LEDBlue.txt
Processing file LEDGreen.txt
Processing file LEDRed.txt
Processing file LEDYellow.txt
~~~

Take a look out the final output

~~~
$ less Ouput.txt | head
~~~
~~~
350.12	4	9	13	8
350.48	8	9	11	7
350.85	3	12	12	4
351.21	11	12	10	5
351.58	13	7	14	8
351.94	12	12	13	8
352.30	4	8	10	15
352.67	8	11	13	14
353.03	10	8	12	13
353.40	11	7	12	9
~~~

**Nice!!!** This is exactly what we wanted. The first two columns correspond to values from the first file (LEDBlue.txt). 
The third column correspond to values from the second file (LEDGreen.txt), the third column are those 
values from the third file (LEDRed.txt), and the last column 
belongs to values from the last file provided as input (LEDYellow.txt). 
However, information regarding what value came from which file was lost. 
An easy way to preserve this is to use the filenames themselves to label the top of the columns.
We can call this variable Header. 
Also, it should be preinitialzed with the name of the value in the X column, 
in this case ‘lambda’ (for the wavelentgh). 

Then, each time through the file reading loop, we can add `\t` plus the filename 
(stored in the variable INfileNAme) to the Header strong:

```python
Header =='\t' + InfileNAme
```

At the end of the program, just before you print the `MasterList`, we can print the Header. 
If we add all this information into our script, it should look like this:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
        python Mergefiles.py *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	for InfileName in FileList:
		sys.stderr.write("Processing file %s\n" % (InfileName))
	Header = 'lambda'
	FileNum=0
	MasterList=[]
	for InfileName in FileList:
		# use the name of the file (w/o extension) as the column Header
		Infile = open(InfileName, 'r') # it's ok for this to be in the file loop
		Header += "\t" + InfileName
		# the line number within each file, resets for each file
		LineNumber = 0 # reset for each file
		RecordNum = 0
		for Line in Infile: # A in figure
			if LineNumber > 0: # skip first Line and blanks
				Line=Line.strip('\n')
				if FileNum==0:
					MasterList.append(Line)
				else:
					ElementList=Line.split('\t')
					MasterList[RecordNum] += "\t" + ElementList[1]
					RecordNum+=1
			LineNumber+=1
		FileNum += 1 # the last statement in the file loop
	print Header
	for Item in MasterList:
		print Item
```

Notice the new lines above with the word **Header**. Now lest make sure that is working:

~~~
python Mergefiles.py LED* > Ouput.txt
Processing file LEDBlue.txt
Processing file LEDGreen.txt
Processing file LEDRed.txt
Processing file LEDYellow.txt
~~~

Take a look out the output

~~~
$ less Ouput.txt | head
~~~

~~~
lambda	LEDBlue.txt	LEDGreen.txt	LEDRed.txt	LEDYellow.txt
350.12	4	9	13	8
350.48	8	9	11	7
350.85	3	12	12	4
351.21	11	12	10	5
351.58	13	7	14	8
351.94	12	12	13	8
352.30	4	8	10	15
352.67	8	11	13	14
353.03	10	8	12	13
~~~

You can see now that we have a header that tell us the origign of diferent values. 
We can also consider stripping off any text after the base filename, for example ".txt", 
using the re.sub() function in python:

```python
Header += "\t" + re.sub('.txt','', InfileName)
```

Let’s replace our previous argument `Header += "\t" + InfileName` with the code above. 
Now if you execute the program you should get something like this: 

~~~
python Mergefiles.py LED* > Ouput.txt
Processing file LEDBlue.txt
Processing file LEDGreen.txt
Processing file LEDRed.txt
Processing file LEDYellow.txt
~~~

Take a look out the output

~~~
$ less Ouput.txt | head
~~~

~~~
lambda	LEDBlue	LEDGreen	LEDRed	LEDYellow
350.12	4	9	13	8
350.48	8	9	11	7
350.85	3	12	12	4
351.21	11	12	10	5
351.58	13	7	14	8
351.94	12	12	13	8
352.30	4	8	10	15
352.67	8	11	13	14
353.03	10	8	12	13
~~~

Finally we can make the feedback information to the user more efficient in the program 
and also return error messages to the user if the format of the input do not match what 
we are expecting. 

```python
sys.stderr.write("Line %d not XY format in file %s\n" % (LineNumber,InfileName))
sys.stderr.write("Converted %d file(s)\n" % FileNum)
``` 

The first line of code above is printing an error message 
if the format is not tab delimitated. The second line is providing a 
message about the file that is being analyzed. 
Also, we should add a code that close the `input` once we finished writing element into the MasterList with `Infile.close()`.   
It is important to pay attention where in the program this new lines of codes will be added. 
At the end you program should look like this:

```python
#!/usr/bin/env python
Usage = """
Mergefiles.py - version 1.0
Convert a series of X Y tab-delimited files
to X Y Y Y format and print them to the screen.
Usage:
        python Mergefiles.py *.txt > combinedfile.dat
"""

import sys
import re

if len(sys.argv) < 2:
	print Usage
else:
	FileList= sys.argv[1:]
	FileNum = 0
	MasterList = []
	Header = "lambda"
	for InfileName in FileList: # statement done one per line
		Header += "\t" + re.sub('.txt','', InfileName)
		Infile = open(InfileName, 'r')
		# The line number within each file, resets for each file
		LineNumber = 0
		RecordNum = 0 # The record number within the table
		for line in Infile:
			if LineNumber > 0: #skipe first line
				Line=line.strip('\n')
				if FileNum == 0:
					MasterList.append(Line)
				else:
					ElementList = Line.split('\t')
					if len(ElementList) > 0:
						MasterList[RecordNum] += ('\t' + ElementList[1]) # += adding instead of replacing
						RecordNum += 1
					else:
						sys.stderr.write("Line %d not XY format in file %s\n" % (LineNumber,InfileName))
			LineNumber += 1
		Infile.close()
		FileNum += 1 # the last stament in the file loop

	print(Header)
	for Item in MasterList:
		print(Item)

	sys.stderr.write("Converted %d file(s)\n" % FileNum)
``` 

Notice in the program above the new lines with the `sys.stderr.write` arguments and the ` Infile.close()` argument.  

If you run your program the output should be the same but now you should get a message 
about how many files you processed:

~~~
python Mergefiles.py LED* > Output.txt
Converted 4 file(s)
~~~

~~~
Line 100 not XY format in file 3
~~~

## In class exercise  

**To submit your answers go to this [repository](https://classroom.github.com/a/_D_BdbQE)**   

Scripts usually start out working well for a certain task and then get repurposed 
for other task. In our case, the script works fine if there is one header 
line in the input files, but if will fail or generate contaminated data if there are 
additional lines. The number of header lines allowed in our program is indicated only in 
one place. 

1. If you wanted to reuse this program for a file that had 17 headers lines. What line of code
would you change in our program?  

	Write the line of code that you will replace here:__      

	What will be the new code?  

	Write the new code here:___   

2. would happen if we don’t included `import sys` in our program?  

	Write you answer here:___  

3. Let’s suppose that the third file that the user provides as input 
has only one column. What error message will be generated?  

	Write you answer here:___  

4. Our program split lines of input files (except the first file) into elements 
that are tab delimitated. However, data could be split by `,` or many other 
characters. In this case is a good idea to define a new variable that takes the delimiter 
provide by the user. Using what you learn about `sys.argv` in this class`. 
Write a variable that reads a delimiter (e.g ',') provided as the first input file.  

	Write your code here:__  
