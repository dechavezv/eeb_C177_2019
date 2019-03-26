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

![]({{ site.url }}/images/phd101212s.png)

"Piled Higher and Deeper" by Jorge Cham, http://www.phdcomics.com


## Setting up git in hoffman2
First you will need to launch a terminal and login into your hoffman2 account.  
Once you have sucessfully login, make sure you are in the home directory.
To get your current working directory type `pwd` from the terminal. You slould get
something like this `/u/home/d/<YourName>`.  

When using Git for the first time, we need to provide a user name and email address.
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

Let's start by sharing the changes we've made to our current project with the
world.  Log in to GitHub, then click on the icon in the top right corner to
create a new repository:

![]({{ site.url }}/images/github-01.png)

Give your repository an apropiate name ('DO NOT called it Give_a_name') for this course and then click "Create Repository":

![]({{ site.url }}/images/github-02.png)

As soon as the repository is created, GitHub displays a page with a URL and some
information on how to configure your local repository. Copy the code under 
**"…or push an existing repository from the command line"**,
return to the terminal, and paste in the two lines. Also, on the top under "Quick setup", 
make sure that "HTTPS" is selected- *not* "SSH":

!![]({{ site.url }}/images/github-03.png)
*Note*: We use HTTPS here because it does not require additional configuration. 
After this class you may want to set up SSH access, which is a bit more secure.  
You can find information on how to do this [here](https://help.github.com/en/articles/connecting-to-github-with-ssh).

For this course we will use HTTPS SSH, tell them they can use keys to authenticate on GitHub instead of passwords, but don’t try to set this up during class: it takes too long, and is a distraction from the core ideas of the lesson.


Go to repository on github. It should contain the folder your create with 
the README file that you wrote. Congratulations!!!


*Optional*: You will notice that every time you type
`git push`. You are being ask for your user name and password. 
To avoid this, you can store your credentials temprarely temporarily. 
Let store to store your credentials for one hour. 

Run the following two commands in your terminal
to store your credentials for one hour
(i.e. you will have to enter your username/pwd once every hour):

Set git to use the credential memory cache:
`git config --global credential.helper cache`

Set the cache to timeout after 1 hour (setting is in seconds):
`git config --global credential.helper 'cache --timeout=3600'`

*Note*: 
