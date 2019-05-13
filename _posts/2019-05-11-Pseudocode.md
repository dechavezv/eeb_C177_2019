---
layout: post
title: " Week 7- Pseudocode "
description: "Continuing to write scripts"
category: articles
tags: [github, Git]
comments: false
---

Goals:
- keep writing scripts for your program.
- Write a pseudocode of your program.

So by now you have the core function of your project figured out.  
You may also have some pseudocode or code to string together the aspects of your project.

## **Pseudocode** what is it?

Pseudocode is an informal way to plan out the structure and flow of your program.
* Don’t worry about syntax of a partiular language.  
* **Do** think about variables and control structure.  
* Pseudocode can be translated across many languages easily.  

Basically you want to write out what you want your computer code to do 
in english before you actually code it.  
This is a great way to organize what your program will do, 
then all you have to figure out is the code to implement your vision. 
Once you figure out your code the pseudocode will be the bulk of the comments within 
the script.

**Pseudocode example:**  
~~~
# write a script that prints a number and its square over a range of values

# set lower and upper range values
# set squaresum to 0

# loop over the range and for each value print
  # currentvalue and the currentvalue^2
  # add currentvalue^2 to squaresum
# print "the sum of it all is" squaresum
~~~

Then you can translate this comments 
into your favorite command language (e.g R). 
Let's elaborate the Pseudocode above in R.  

```R
# write a script that prints a number and its square over a range of values  

# set lower and upper range values  
lower = 1; upper = 5  

# set squaresum to 0  
squaresum = 0  

# loop over the range and for each value print  
  # currentvalue and the currentvalue^2  
  # add currentvalue^2 to squaresum  
for (ii in lower:upper){  
  cat(ii, ii^2, "\n")  
  squaresum <- squaresum +  ii^2  
}  

# print "the sum of it all is" squaresum
cat("the sum of it all is", squaresum)  
```     
There is no right or wrong way to write pseudocode, 
and [here](https://kopywritingkourse.com/guides/how-to-write-pseudocode/) 
is a tutorial on how to write pseudocode:

---

Today in discussion, you want to finish writing your pseudocode. 
You should also figure out who in your group is responsible for writing the code 
that will replace each part of the pseudo code.

There is a folder on our class GitHub 
[here](https://github.com/pceeb/UCLA_Spring_2019/tree/master/Term_project/Example_scripts) 
that contains useful scripts that you can incorporate into your project.  

There is also a folder on our class GitHub 
[here](https://github.com/pceeb/UCLA_Spring_2019/tree/master/Term_project/Example_data) 
that includes example taxonomy data for the `fishbase` like projects.

_Just as a final friendly reminder:_
Your projects should be able to run on **Hoffman2**.  
