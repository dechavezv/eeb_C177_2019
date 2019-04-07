---
layout: post
title: " Week 1- Set up SSH for Windows users "
description: "Guide to set a hoffman account for Windows users"
category: articles
tags: [github, Git]
comments: false
---

This guide will take you 
step by step through the 
process of using SSH from 
within the Google Chrome web browser.   

First you need to download the Google Chrome web browser. Then, 
copy this electronic adress in your browser 
`https://chrome.google.com/webstore/detail/secure-shell-app/pnhechapfaindjhompbnflcldabbghjo`. 
You Install `ssh` as a Chrome extension by clicking the **Add to Chrome** button on the extension home page.   

![]({{ site.url }}/images/Add_to_chrome.png)

Once the installation has completed, type into the browser `chrome://apps/` you should see the Secure shell App listed. Then, 
click the new Secure Shell Extension icon from the Chrome Menu apps.

![]({{ site.url }}/images/list_apps.png)

A new browser window will appear. Here you go! You can use the up/down and left/right arrows on your keyboard to navigate to each field – or your mouse. 

![]({{ site.url }}/images/empty_shh.png)

Filled in these 3 fields: **username@hostname**, 
**username** and **hostname**. Then hit the enter key on your keyboard (or click the [ENTER] Connect button). 
Here you have an exmple of Daniel's screen.

![]({{ site.url }}/images/Filled_ssh.png)

The first time you use Secure Shell Extension you’ll be asked if you’d like to open future SSL links using the Secure Shell Extension extension. If you do, click Allow – otherwise Block (which won’t really block anything, it’ll just leave whatever your current default App for opening SSL links as the default).

![]({{ site.url }}/images/Allow_first_time.png)

You may be ask if you want to continue conecting, 
just type `yes`.

![]({{ site.url }}/images/RSA_key.png)

Now you’ll be connected to hoffman and be prompted with a request for your password. At this point you’ll be using a fully functional hofmman account.

![]({{ site.url }}/images/login.png)
