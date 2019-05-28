---
layout: post
title: " Week 9- Finish your program "
description: "Finish your program"
category: articles
tags: [github, Git]
comments: false
---

Goals:
- Finish the first version of your program.  

So by now you should have some code of your project and probably a script that strings it all together. 
Today in discussion, you are going to keep working on this script. 

If you have already all the components of your program. One way to put everything together is  to group chunks of your code into simple building blocks called functions, each of this functions should take some input and return some output.  

I would recommend keeping it simple, and close your code into small functions that perform basic operation. 
Here is an example in python taken from [Alessina](http://computingskillsforbiologists.com/wp-content/uploads/2019/01/All_code_boxes.pdf), 2019:    
```python
# Make letter upper case
dna = dna.upper() 

# Count the occurrences of each nucleotide
numG = dna.count("G")

numC = dna.count("C")

numA = dna.count("A")

numT = dna.count("T")

#Calculate, (G + C) / (A + T + G + C)
return (numG + numC) / (numG + numC + numT + numA)
```

Now lets group everything as a single funtion  

```python
#Closed everything nto a function
def GCcontent(dna):
	#our funtion is called GCcontent and
	#accepts a single argument called dna;
	#assume that the input is a DNA sequence encoded
	# Make letter upper case
	dna = dna.upper() 
	# Count the occurrences of each nucleotide
	numG = dna.count("G")
	numC = dna.count("C")
	numA = dna.count("A")
	numT = dna.count("T")
	
	#Calculate, (G + C) / (A + T + G + C)
	return (numG + numC) / (numG + numC + numT + numA)
```

Once we have everything contained within a funtion, we just have to called it like this:  

```python
In [1]: GCcontent("AATTTCCCGGGAAA")
Out[1]: 0,42857142857142855
``` 
[Here](https://linuxize.com/post/bash-functions/) is a link about funtions in `bash`. 
[Here](https://dechavezv.github.io/eeb_C177_2019//lecture_pdfs/Week8_Monday.html) there is
is a link about funtions in `R`.

Remember that you can find samples of scripts and data here:     

There is a folder on GitHub [here](https://github.com/pceeb/UCLA_Spring_2019/tree/master/Term_project/Example_scripts) that contains useful scripts that you can incorporate into your project.  

There is also a folder on GitHub [here](https://github.com/pceeb/UCLA_Spring_2019/tree/master/Term_project/Example_data) that includes example taxonomy data for the `fishbase` like projects.  

---

# Just as a final friendly reminder:    

Your projects should be able to run on Hoffman2.

You will have the opportunity to tell us how much work you think that your teammate(s) did at the end of the project.  We will take that into consideration when grades are determined.  If you have been slacking, now is the time to make a change.

---

# Homework

Submit a complete version of the program in this [repository](https://classroom.github.com/a/5fMKlAPe). 
The program should take some input and give the desire output. This is due before next discussion section.  
