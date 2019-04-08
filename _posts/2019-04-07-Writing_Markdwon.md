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
- Understand the basics of how Markdown works.
- Modify a README file with Markdown.
- Write a CV with Markdown.

Markdown is just a way to style text documents with just a few special characters like `#` or `*`. People use Markdown to take notes from class, write papers for publication, make presentations,etc.   
Whatever is your document, you can specify the format of words 
as bold or italic, add images, create lists, etc. Here are some of 
the things you can do with Markdown:
* Paragraphs and line breaks
* Headers
* Lists
* Code blocks
* Links
* Emphasis
* Images

Why we use it?

* **Version control**: 
With Markdown is quite straight forward to keep track of changes made by collaboratos.

* **Edit with any platform**: 
You can edit Markdown files on any platform. For instance you can use [LaTex](https://www.latex-project.org) or [Rstudio](https://www.rstudio.com).

* **Limited features**: 
Instead of hundreds of buttons to do different kinds of formatting, Markdown only supports limited features and you can easily learn the syntax in less than an hour. 

* **File size**: 
Single text generated in Markddown can store many times more information than a word document.

## Exercise 1: Understanding Markdown characters
 
Markdown files are saved as `<file>.md` or `<file>.markdown`. Let’s explore the file `example.md` located at `~/classdata/Labs/Lab2`.  
First login into your hoffman account and get an interactive node. 
Make sure that you are located in your `HOME` directory. Also, dont forget to load git into hoffman.

~~~
$ ssh c177-t0@hoffman2.idre.ucla.edu
[c177-t0@login2 ~]$ qrsh
[c177-t0@n2188 ~]$ module load git
[c177-t0@n2188 ~]$ pwd
~~~
{:  .language-bash}
~~~
/u/home/class/c177/c177-t0
~~~
{:  .output}

Copy the file `example.md` into your HOME directory, Then, open the file using `less`  
**Hint**: your current directory is HOME. Therfore, you can type `cp <path to the file>/example.md ./` where `./` is your current directory.

Lets look inside `example.md`
~~~
[c177-t0@n2188 ~]$ less example.md
~~~
{:  .language-bash}
**Note**: To quit from less type `q`

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

This is very useful information about especial characters in Markdown. However, is hard to 
visualize the effect of this symbols on the output file without graphic features. The downside about Hoffman, is that it doesn't have a graphical interface. 
Therefore, we need to export the document to our Desktop and visualize the information with [Rstudio](https://www.rstudio.com).  

It is worth to mention that Rstudio is not just a tool useful 
to edit and write files through Markdown. `R` is a programming language and free software environment for statistical, computing and graphics. We will learn more about R latter in the quarter; go [here](https://www.r-project.org) if you want to learn more about `R`. 

Since you have `Rstudio` install in your personal computers, you need to transfer `example.md` from hoffman to a directory located in your personal computer. First, open another terminal. 
Second, go to your Desktop and create a folder called 
`c177_Labs`. Then, navigate to the new folder with `cd`.  
**Hint**: the path to your Desktop should be `~/Desktop/`

Once you are located in the new directory called `c177_Labs`, 
transfer the file `example.md` from hoffman to your local directory 
`~/Desktop/c177_Labs`. There are many 
tools available to transfer files. Some of the most populars are [Globus](https://www.globus.org/data-transfer) and [Cyberduck](https://cyberduck.io). Today, we will use 
a simple command called `scp` that only requiers the path of the file you want 
to copy and the destination path.

~~~
Daniels-MacBook:c177_Labs$ scp c177-t0@hoffman2.idre.ucla.edu:/u/home/class/c177/c177-t0/example.md ./
~~~
{:  .language-bash}
**Note**: Since you are alredy located at `c177_Labs` you can just type `./` to epecify the location
where you want to copy the file. Alternatively, you could provide the whole destination path 
which in my case is `/Users/dechavezv/Desktop/c177_Labs`

After typing your password, you should get a message like this:

~~~
example.md                       100% 1741   104.0KB/s   00:00  
~~~
{:  .output}

From your computer launch Rstudio then click `File`, `Open file ..`, and chose `example.md`. This will load the 
information of the file into R. Then, to visualize the ouput click on `Preview`.  
The default ouput in Rstusio is HTML. Click on the arrow next 
to `Preview` in case you want to generate a pdf or word document.

![]({{ site.url }}/images/Markdown_01.png)

After your click `Preview`, you should get an ouput file that looks something like this:

![]({{ site.url }}/images/Markdown_02.png)

Take a moment to read the document you just generated. What are the diferent character (`#`, `*`, `<br>`) doing?   
Now that you have a better idea about the role of special symbols in Markdown, lets write our own document.

## First Markdown challenge !!!!

On hoffman, navigate to `eeb-177`. There, you will find a Document called `README.txt`. If 
you do `less` on that file you will see the following information: "*In-class exercise and HW for eeb-177:*"  
Based on the information you analyzed previously for `example.md `, improve the information of your `README.txt` file using Markdown. Then, push the changes to your Github repository. 
Here is the list of things you must do for this first challenge. 

1. Change the name of the file from README.txt to README.md.  
**Note**: Markdown files are read as <file>.md.  
2. Transfer `README.md` from hoffman to `c177_Labs` directory located at your Desktop.
3. Open the `README.md` file with Rstudio.  
4. Then do the following changes.  
- [ ] Add the title "My favorite animal" to `README.md`.  
- [ ] the scientific name of your animal with bold and italic.  
- [ ] Add a list of interesting facts about your animal.  
- [ ] Add a link to a nice picture of your animal.  
- [ ] Add a link to a youtube video of your animal.  
5. Save the document.
6. Transfer `README.md` from `~/Desktop/c177_Labs` back to `eeb-177` in hoffman.
7. Navigate to `eeb-177`. Then, save and push your changes to your github repostiory.  
**Hint**:`add` `commit` and `push` maybe useful.
8. Go to your github repository and verify that the changes were made.

Is fun to write something about our favorite animal. But, now lets try to do something work-related. 
In the next part of the lab you will write your CV as a Markdown document and push it to a GitHub repository.

Before doing the next challenge, on hoffman navigate to your HOME and create a directory called `curriculum-markdown`. Then, copy the document 
`example_CV.md` from `classdata/Labs/Lab2` to `curriculum-markdown`.


## Second Markdown challenge !!!!
1. Transfer `example_CV.md` from `curriculum-markdown` to `~/Desktop/c177_Labs` in hoffman.  
2. Open `example_CV.md` file in Rstudio.
3. Use this file as a template to write your own CV.
4. Save the document in Rstuio.
5. Transfer `example_CV.md` from `~/Desktop/c177_Labs` to `eeb-177` in hoffman.
6. Navigate to `eeb-177/curriculum-markdown` and make the directory a repository.  
**hint**: new direcotries are not repostiories by default. If you type `ls -a` you will **NOT** see the hidden 
`.git` directory that defines a repository. Try to remember what is the git command that you must type to 
make `.git` apper for the first time.   
8. Copy `example_CV.md` into the `curriculum-markdown` directory.
9. Save your changes in `.git`.  
**Hint**:use the git commans you alredy now.  
10. Go to your GitHub account and create a new repository called `curriculum-markdown`.  
**Hint**: you create Github repositories like this last week  
11. Push your changes to the repository you just created.  
**Hint**: you may want to copy and paste information shown in the Github repository you just crated. Again, you did this last week.   
12. Go to your github repository and verify that the changes were actually made.

:clap: Congratulations!! You have created a nice CV that you can share with the world. This is way better than "Hello world!!"
