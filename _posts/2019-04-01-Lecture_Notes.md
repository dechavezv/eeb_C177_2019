---
layout: post
title: " Week 1- Lecture Notes from Monday"
description: "Guide to undertand what we did during lecture"
category: articles
tags: [github, Git]
comments: false
---

# What You Should Know From Lecture: Week 1

### Monday:
We learned about Hoffman2.
* There was an [in class presentation](https://dechavezv.github.io/eeb_C177_2019//lecture_pdfs/week1_Lecture_hoffman.pdf)
* IDRE maintains an excellent page for everything [Hoffman2](https://www.hoffman2.idre.ucla.edu/)

  * The Bearden Lab has a great "How To" guide for using [Hoffman2](https://sites.google.com/site/uclabeardenlab/how-to-guides/hoffman)

  * There is also a Neuroscience [Hoffman2 Wiki page](https://www.ccn.ucla.edu/wiki/index.php/Hoffman2)
---
How to gain access to Hoffman2?
  * You need an ssh client
    * Mac / UNIX and Linux people can use terminal
    * PC people need to download an [ssh client](https://www.hoffman2.idre.ucla.edu/access/#Windows)
    * If you have a browser, you can download and ssh client app.
      * Here are [chrome](https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo?hl=en) and [firefox](https://addons.mozilla.org/en-US/firefox/addon/sshgate-ssh-client-terminal/) options.
---
We learned how to login to Hoffman2
  * You need to open your Shell.  It should have a prompt that looks like this:

~~~
Last login: Fri Apr  5 10:07:25 on ttys003
EMilys-MacBook-Pro-7:~ limeybean$
~~~
{:  .language-bash}

* Type the following:
   * Note: Instead of using c177-i0 you will add your username
~~~
Last login: Fri Apr  5 10:07:25 on ttys003
EMilys-MacBook-Pro-7:~ limeybean$ ssh c177-i0@Hoffman2.idre.ucla.edu
~~~
{: .language-bash}
* You will see the following:

~~~
Last login: Fri Apr  5 10:07:25 on ttys003
EMilys-MacBook-Pro-7:~ limeybean$ ssh c177-i0Hoffman2.idre.ucla.edu
c177-i0hoffman2.idre.ucla.edu's password:
~~~
{:  .output}
* Type your password in the command prompt.
  * Note: You will not be able to see what you typed.  

* After you enter your password you will see the following:

~~~
Last login: Fri Apr  5 14:58:57 on ttys000
EMilys-MacBook-Pro-7:~ limeybean$ ssh c177-i0@hoffman2.idre.ucla.edu
c177-i0@hoffman2.idre.ucla.edu's password:
Last login: Wed Apr  3 07:25:55 2019 from wifi-131-179-12-73.host.ucla.edu
Welcome to the Hoffman2 Cluster!

Hoffman2 Home Page:     http://www.hoffman2.idre.ucla.edu
Consulting:             https://support.idre.ucla.edu/helpdesk

All login nodes should be accessed via "hoffman2.idre.ucla.edu".

Please do NOT compute on the login nodes.

Processes running on the login nodes which seriously degrade others'
use of the system may be terminated without warning.  Use qrsh to obtain
an interactive shell on a compute node for CPU or I/O intensive tasks.

The following news items are currently posted:

   IDRE Advanced Computing Classes
   News Archive On Web Site

Enter shownews to read the full text of a news item.
[c177-i0@login3 ~]$
~~~
{:  .output}
* Congratulations you are in a login node!

* How do you know it is a login node?

~~~
[c177-i0@login3 ~]$
~~~
{:  .language-bash}
* The shell will indicate it.  Look for the "login" to the left of the command line prompt.  
  * the number after the login tells you which node you logged into.
  * You will also notice that your user name is displayed before the @
  * You will also see a "~" after the login node
    * this indicates that you are in your home ($HOME) directory
  * the $ indicates that this is the command line prompt
    * You can change the symbol if you want.
    * If you figure out how to do it please teach us all how to do it in class!
* Computing in a login node is frowned upon. Depending on what you do in a login mode, your shell might be terminated.
  * To check out a compute node type the following

~~~
[c177-i0@login3 ~]$ qrsh
~~~
{:  .language-bash}
* You will almost immediately  get the following response from Hoffman2

~~~
[c177-i0@login3 ~]$ qrsh
~~~
{:  .language-bash}
~~~
JSV: No h_data is set; setting default h_data=1G (if this value is too small, the job will fail)
~~~
{:  .output}

* This means that you are going to get 1G of memory for a short period of time
  * ~ 2 Hours
  * It will close after a period of inactivity

* Eventually you will be assigned a compute node

~~~
[c177-i0@login3 ~]$ qrsh
JSV: No h_data is set; setting default h_data=1G (if this value is too small, the job will fail)
[c177-i0@n9758 ~]$
~~~
{:  .language-bash}

* Notice that instead of '@login3' you now see '@n9758'
  * the n indicates that you have a compute node and it is number n9758
  * later in the class you will learn how to check out larger amounts of data and for longer time periods.

* to logout of a compute node type the following:

~~~
[c177-i0@n9758 ~]$ logout
~~~
{:  .language-bash}

* You will get the following response:

~~~
Connection to n9758 closed.
[c177-i0@login3 ~]$
~~~
{:  .language-bash}

__If you are using a different means to login, check the tutorials for those programs to learn how to ssh into Hoffman2.  Once you are in all of the commands are the same__

---

# Monday Challenge

If you figure out how to change the command line prompt and make a small tutorial for the class instructing us how it is done, you will get a reward!  There is not limit to the number of people that can have the reward.
