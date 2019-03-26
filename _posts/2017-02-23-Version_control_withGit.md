---
layout: post
title: " Week 1- Version control with git and Introduction to Github "
description: "Guide to undertand version control with git and setup a github account"
category: articles
tags: [github, Git]
comments: false
---
**Information in this document is based on the following sites** [1](https://www.hoffman2.idre.ucla.edu),[2](http://swcarpentry.github.io/git-novice/),[3](https://eeb177-w17.github.io)

Wether you are working on a report for your class, a manuscript for publication or some nice codes for your research, version control can help you to keep track of your work.

![]({{ site.url }}/images/hoffman_login.png)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com


## Setting up git in hoffman2
First you will need to launch a terminal and login into your hoffman2 account.  
Once you have sucessfully login, make sure you are in the home directory.
To get your current working directory type `pwd` from the terminal. You slould get
something like this `/u/home/d/<YourName>`.  

When we use Git for the first time, we need to provide a user name and email address.
This information will be associated with your Git activity. Therefore, any
changes pushed to [GitHub](https://github.com/) will include your user name and email address.

Whenever you use git in the terminal, Git commands will be written as `git verb options`. But what is this?
`verb` is what you want to do, `options` refers to additional optional information that could be needed for `verb`. With this in mind, here is how you will set up your
name and email adress for the first time in the terminal:

~~~
git config --global user.name "YOUR NAME"
git config --global user.email "YOUR EMAIL ADDRESS"
~~~
{: .language-bash}

To check that the right everything worked fine you can type from the terminal `git config --list`.   
