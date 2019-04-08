---
layout: post
title: " Week 2- Writing Markdown "
description: "Guide to undertand Markdown"
category: articles
tags: [github, Git]
comments: false
---
Goals:
- Understand the benefits of Markdown.
- Understand the basics of Markdown works.
- Modify a README file with Markdown.
- Write a CV with MArkdown.

Markdown is a way to style text on the web. 
You control the display of the document; formatting words 
as bold or italic, adding images, and creating lists are just 
a few of the things we can do with Markdown. Mostly, Markdown is 
just regular text with a few non-alphabetic characters thrown in, like # or *.

Some of the things you can do with Markdown are:
* Paragraphs and line breaks
* Headers
* Lists
* Code blocks
* Links
* Emphasis
* Images

Why would you use it?

* **Version control**: 
With Markdown is quite straight forward to keep track of change when colabprating with other people.

* **Edit with any platform**: 
You can edit Markdown files on any platform such as [LaTex](https://www.latex-project.org) and [Rstudio](https://www.rstudio.com).

* **Limited features**: 
Instead of hundreds of buttons to do different kinds of formatting. With Markdown it’s much easier as it only supports limited features and you can easily learn the syntax in less than an hour. 

* **File size**: 
Single text generated in Markddown can store many times more information than a .doc document.

Markdown files are saved as `<file>.md` or `<file>.markdown`. Let’s explore the file example.md located at `~/classdata/Labs/Lab2`.  
First login into your hoffman account and make sure that you are located in your `HOME` directory.  

~~~
$ ssh c177-t0@hoffman2.idre.ucla.edu
[c177-t0@login2 ~]$ pwd
~~~
{:  .language-bash}
~~~
/u/home/class/c177/c177-t0/classdata/Labs/Lab2
~~~
{:  .output}

Copy the document on your HOME directory and open it using `cat`
**Hint**: you may want to use something like this: `cp <path to the file>/example.md /u/home/class/c177/c177-t0`. 
Alternatively, since you are within the HOME directory you can type `cp <path to the file>/example.md ./` where `./` is saying that we want to copy the file in the current directory.

Lets look inside `example.md`
~~~
[c177-t0@login2 ~]$ cat example.md
~~~
{:  .language-bash}

~~~
## Here is an example of a markdown file

Headers are indicated with `#`.

You can try diferent types of headers depending on how many `#` you write:

```
# H1
## H2
### H3
#### H4
##### H5
###### H6
```

# H1
## H2
### H3
#### H4
##### H5
###### H6

To especified the end of a line you can use double space or <br>.
~~~
{:  .output}

Here there is useful information about some characters and the funtion in a simple text file. However, is hard to 
visualize this text-style changes without a graphic features. Hoffman doesnt have graphical interface. 
Therefore, we will export the document into our Desktop and visualize it with [Rstudio](https://www.rstudio.com). It is worth to mention that Rstudio is not just a tool useful 
to edit and write file through Markdown. `R` is a programming language and free software environment for statistical, computing and graphics. We will learn more about R latter in the quarter but go (here)[https://www.r-project.org] if you want to learn more about `R`. 

Since we have `Rstudio` install on our personal computers, you have to transfer `example.md` to a directory in your personal computer.  

Create a folder called `c177_Labs` located at `~/Desktop/`. Then, navigate to `~/Desktop/c177_Labs`

~~~
Daniels-MacBook:~ dechavezv$ cd ~/Desktop/
Daniels-MacBook:Desktop dechavezv$ mkdir c177_Labs
Daniels-MacBook:Desktop dechavezv$ cd ~/Desktop/c177_Labs
Daniels-MacBook:c177_Labs$ 
~~~
{:  .language-bash}

Transfer the file `example.md` from hoffman to your local directory `~/Desktop/c177_Labs`. There are many 
tools available to transfer file. Some of the most populars are [Globus](https://www.globus.org/data-transfer) and [Cyberduck](https://cyberduck.io). Today, we will use 
a simple command called `scp` that only requiers the whole path of the file you want 
to copy and the destination path.

~~~
Daniels-MacBook:c177_Labs$ scp c177-t0@hoffman2.idre.ucla.edu:/u/home/class/c177/c177-t0/example.md ./
~~~
{:  .language-bash}

After typing your password the file should be transfer

~~~
example.md                       100% 1741   104.0KB/s   00:00  
~~~
{:  .output}

From yout computer launch RStudio then click `File`, `Open file ..`, and chose `example.md`. This will load the 
information of the file into R. Then, to visualize the ouput click on `Preview`. The default ouput is HTML, click on the arrow next 
to `Preview` to generate a pdf or word version.

![]({{ site.url }}/images/Markdown_01.png)

After your click `Preview`, there should be something like this.

![]({{ site.url }}/images/Markdown_02.png)

Take a moment to understand the role of diferent character (`#`, `*`, `<br>`)  on the output. Now that you have 
a better idea about the role of special symbols in Markdown, lets write our own document.

On hoffman, navigate to eeb-177. There, you will find a Document called README.txt containing the following information: "In-class exercise and HW for eeb-177:
Based on the information shown in the `example.md ` file, your challenge will be to improve the information of your README.txt file by using Markdown and push the changes to your Github repository. 
Here are the things you must do. 

## First Markdown challenge !!!!
1. Change the name of the file from README.txt to README.md
2. Transfer `README.md` from hoffman to `~/Desktop/c177_Labs`
3. Open the `README.md` file in Rstudio.
4. Then do the following changes.  
	*Add the title "My favorite animal" to `README.md`.  
	*Add a scientific name with bold and italic.  
	*Add a list of interesting facts.  
	*Add a link to a nice picture of your animal.  
		+Add a link to a youtube video of your animal.  
5. Save the document in Rstuio.
6. Transfer `README.md` from `~/Desktop/c177_Labs` back to `eeb-177` in hoffman.
7. Navigate to `eeb-177`. Then, save and push your changes to your github repostiory.
8. Go to your github repository and verify that the changes were made.

Using Markdown to write information about animal is fun. But, now lets try something different. 
In the next part of the lab you will write your CV as a Markdown document and push it to a github repository.

Before doing the next challenge, on hoffman navigate to HOME and create a directory called `curriculum-markdown`. Then, copy the document 
`example_CV.md` into the directory you just created.  


## Second Markdown challenge !!!!
2. Transfer `example_CV.md` from hoffman to `~/Desktop/c177_Labs`
3. Open the `example_CV.md` file in Rstudio.
4. Use this file as a template to write your own information.
5. Save the document in Rstuio.
6. Transfer `example_CV.md` from `~/Desktop/c177_Labs` to `eeb-177` in hoffman.
7. Navigate to `eeb-177/curriculum-markdown` and make the directory a repository. 
**hint**: new direcotries are not repostiories by default. If you type `ls -a` you will not see the hidden 
.git directory tht defines a repository. Try to remember what is the git command that you must type to 
make .git apper.   
8. Copy example_CV.md into `curriculum-markdown`
9. Save your changes in `.git`.
9. Go to your GitHub account and create a new repository called `curriculum-markdown`.
**hint**: you did this last week
10. Push your changes to the repository you just created.
**hint**: you may want to copy and paste information contained in the Github repository you just crated; you did this last week. 
8. Go to your github repository and verify that the changes were made.

Congratulations!! You have created a nice CV than you can now share with the world.
