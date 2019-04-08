---
layout: post
title: " Week 2- Lecture Notes from Monday Part I"
description: "Guide to undertand what we did during lecture"
category: articles
tags: [github, Git]
comments: false
---

# What You Should Know From Lecture: Week 2

### Monday pt 1:
#### Announcements-
* You have Homework that is due next Wednesday at 8:00:00 am. To get the assignment, paste the following link in your browser: https://classroom.github.com/a/E9rVxfnZ

 Follow the instructions. When you get to the window "You are ready to go! " go to the link that is next to the message "Your assignment has been created here:" This should lead you a repository with a document called “First_assignment.txt” with information about the Homework.

 __NOTE:__ You should now how add information to a file and clone/save/push a repository and. If you don’t remember how to do this, go to the W1 Version-control document available on the curse website.

* For discussion this week, you need to bring a draft of your CV.  You will learn to convert it to a Markdown document, and you will give each other feedback.

---

Hopefully you all moved the following documents into ~/Lecture_1/syllabus/partial_documents:
* final_project.txt                        
* Lab_assignments_participation.txt
* Homework.txt                           
* In_class_Participation.txt

Remember that they are stored in ~/classdata/Week1/Monday_in_class

If you have not done so use

```
[c177-i0@n2010 ~]$ cp  ~/classdata/Week1/Monday_in_class/final_project.txt  ~/Lecture_1/syllabus/partial_documents
```
```
[c177-i0@n2010 ~]$ cp  ~/classdata/Week1/Monday_in_class/Homework.txt  ~/Lecture_1/syllabus/partial_documents
```

etc...

---

We can past these file together using 'cat' which pretty much concatenates files together end-to-end. Lets move into the partial_documents directory and try the following

```
[c177-i0@n2010 partial_documents]$ cat Homework.txt  final_project.txt Lab_assignments_participation.txt Homework.txt In_class_Participation.txt
```

We will see the following

```
__Homework:__

This course includes a broad range of topics and tools. Practice is the best way to learn how to program and homework assignments will prepare you for in class activities. Homework assignments will help you learn and master basic programming skills. Homework assignments will be submitted electronically before class. The submission cutoff is 7:45 am the day of class. Late submissions will be accepted but penalized 10% each day late (submitting 7:46 the day of class counts as 1 day late).
__Final Project:__

The final project for this course will require you to produce software that manipulates and analyzes data.  This software must have a practical application for a current research project. If you do not currently have a research project will be paired with a researcher that has a computational need that is appropriate for the scope of the course and student group size.   Student group size will depend on the size of the program required for the research project and whether you are an undergraduate or a graduate student.

__Your final project will include and be evaluated based on the following criteria.__
* Cleaver or insightful program name.  Everyone loves a bad acronym.  
* Name and contact info for project members.
* Your Readme file.
* How well you justify the purpose of the program in the background / introduction of the readme.
* The clarity of the program workflow including the use dependencies.
* The instructions for running your program. The expected output of your program. The references cited in the readme.
* The completeness and effectiveness of scripts for accomplishing the research goal.  They can be written in Bash, Python, and or R.
* The clarity of the vignette for teaching the researcher to use the software and the presence of example data, example output, and run and error logs.
__Lab assignments / participation:__

You must attend computer lab. Computer lab assignments are designed to result in a practical product like a CV or website or to provide benchmarks and feedback on the final project. This is your opportunity to get immediate feedback on your final project and a good way to get personalized attention from Daniel.  All computer lab assignments must be turned in 15 minutes before your scheduled computer lab session.__Homework:__

This course includes a broad range of topics and tools. Practice is the best way to learn how to program and homework assignments will prepare you for in class activities. Homework assignments will help you learn and master basic programming skills. Homework assignments will be submitted electronically before class. The submission cutoff is 7:45 am the day of class. Late submissions will be accepted but penalized 10% each day late (submitting 7:46 the day of class counts as 1 day late).
__In class participation:__

You will work alone or in teams during class time to generate scripts, solve problems, and participate in class challenges. These activities are designed to test your understanding of your homework assignments and challenge you to think more creatively about programming. All in class activities must be turned in during class to the course GitHub. If you have an excused absence (criteria for an excused absence is detailed below), you will be given an alternate exercise.  The lowest in class assignment score will be dropped from your in-class participation grade.
[c177-i0@n2010 partial_documents]$
```

You can verify that the file content is being added in order by looking at each file using 'head' or 'less'.

```
[c177-i0@n2010 partial_documents]$ head Homework.txt
__Homework:__

This course includes a broad range of topics and tools. Practice is the best way to learn how to program and homework assignments will prepare you for in class activities. Homework assignments will help you learn and master basic programming skills. Homework assignments will be submitted electronically before class. The submission cutoff is 7:45 am the day of class. Late submissions will be accepted but penalized 10% each day late (submitting 7:46 the day of class counts as 1 day late).
```
```
[c177-i0@n2010 partial_documents]$ head final_project.txt
__Final Project:__

The final project for this course will require you to produce software that manipulates and analyzes data.  This software must have a practical application for a current research project. If you do not currently have a research project will be paired with a researcher that has a computational need that is appropriate for the scope of the course and student group size.   Student group size will depend on the size of the program required for the research project and whether you are an undergraduate or a graduate student.

__Your final project will include and be evaluated based on the following criteria.__
* Cleaver or insightful program name.  Everyone loves a bad acronym.  
* Name and contact info for project members.
* Your Readme file.
* How well you justify the purpose of the program in the background / introduction of the readme.
* The clarity of the program workflow including the use dependencies.
```

We can now make a new document to store this information using a redirect '>'.

```
[c177-i0@n2010 partial_documents]$ cat Homework.txt  final_project.txt Lab_assignments_participation.txt Homework.txt In_class_Participation.txt > new_file.txt
```

Now lets see what is in the directory

```
[c177-i0@n2010 partial_documents]$ ls
final_project.txt  In_class_Participation.txt         new_file.txt
Homework.txt       Lab_assignments_participation.txt
```

We can check out the contents of the file using 'less'

```
[c177-i0@n2010 partial_documents]$ less new_file.txt

__Homework:__

This course includes a broad range of topics and tools. Practice is the best way to learn how to program and homework assignments will prepare you for in class activities. Homework assignments will help you learn and master basic programming skills. Homework assignments will be submitted electronically before class. The submission cutoff is 7:45 am the day of class. Late submissions will be accepted but penalized 10% each day late (submitting 7:46 the day of class counts as 1 day late).
__Final Project:__

The final project for this course will require you to produce software that manipulates and analyzes data.  This software must have a practical application for a current research project. If you do not currently have a research project will be paired with a researcher that has a computational need that is appropriate for the scope of the course and student group size.   Student group size will depend on the size of the program required for the research project and whether you are an undergraduate or a graduate student.

__Your final project will include and be evaluated based on the following criteria.__
* Cleaver or insightful program name.  Everyone loves a bad acronym.  
* Name and contact info for project members.
new_file.txt
```

Remember that "q" allows you to exit 'less'.

Lets remove new_file.txt

```
[c177-i0@n2010 partial_documents]$ rm -i new_file.txt
rm: remove regular file `new_file.txt'? y
[c177-i0@n2010 partial_documents]$
```

Remember that the -i flag asks you if you really want to do this.

Now, review the contents of the syllabus document in ~/Lecture_1/syllabus/full_document/

You can do this a number of ways...

```
[c177-i0@n2010 partial_document]$ less ../syllabus/full_document/syllabus.txt
```

```
[c177-i0@n2010 partial_document]$ cd ../syllabus/full_document/
[c177-i0@n2010 partial_document]$ less syllabus.txt
```

etc

Now take note of the order in which the syllabus addresses the
`final_project.txt`
`In_class_Participation.txt`  
`Homework.txt`       `Lab_assignments_participation.txt`

Use cat to make a new document called 'course_assignments.txt' that puts the information from `final_project.txt`
`In_class_Participation.txt`  
`Homework.txt`       `Lab_assignments_participation.txt` in the same order found in the syllabus.

course_assignments.txt should look like the following:

```
__In class participation:__

You will work alone or in teams during class time to generate scripts, solve problems, and participate in class challenges. These activities are designed to test your understanding of your homework assignments and challenge you to think more creatively about programming. All in class activities must be turned in during class to the course GitHub. If you have an excused absence (criteria for an excused absence is detailed below), you will be given an alternate exercise.  The lowest in class assignment score will be dropped from your in-class participation grade.
__Homework:__

This course includes a broad range of topics and tools. Practice is the best way to learn how to program and homework assignments will prepare you for in class activities. Homework assignments will help you learn and master basic programming skills. Homework assignments will be submitted electronically before class. The submission cutoff is 7:45 am the day of class. Late submissions will be accepted but penalized 10% each day late (submitting 7:46 the day of class counts as 1 day late).
__Lab assignments / participation:__

You must attend computer lab. Computer lab assignments are designed to result in a practical product like a CV or website or to provide benchmarks and feedback on the final project. This is your opportunity to get immediate feedback on your final project and a good way to get personalized attention from Daniel.  All computer lab assignments must be turned in 15 minutes before your scheduled computer lab session.__Final Project:__

The final project for this course will require you to produce software that manipulates and analyzes data.  This software must have a practical application for a current research project. If you do not currently have a research project will be paired with a researcher that has a computational need that is appropriate for the scope of the course and student group size.   Student group size will depend on the size of the program required for the research project and whether you are an undergraduate or a graduate student.

__Your final project will include and be evaluated based on the following criteria.__
* Cleaver or insightful program name.  Everyone loves a bad acronym.  
* Name and contact info for project members.
* Your Readme file.
* How well you justify the purpose of the program in the background / introduction of the readme.
* The clarity of the program workflow including the use dependencies.
* The instructions for running your program. The expected output of your program. The references cited in the readme.
* The completeness and effectiveness of scripts for accomplishing the research goal.  They can be written in Bash, Python, and or R.
* The clarity of the vignette for teaching the researcher to use the software and the presence of example data, example output, and run and error logs.
~
~
~
(END)
```

---

Lets move this new document to the full_document directory.  We could make a copy of it using 'cp' but perhaps we do not need multiple copies of course_assignments.txt. You will use 'mv'.

```
[c177-i0@n2010 partial_documents]$ ls
course_assignments.txt                 In_class_Participation.txt
Do_first_Build_directory_exercise.txt  Lab_assignments_participation.txt
final_project.txt                      syllabus.txt
Homework.txt
[c177-i0@n2010 partial_documents]$ mv course_assignments.txt  ../full_document/
[c177-i0@n2010 partial_documents]$ ls
Do_first_Build_directory_exercise.txt  In_class_Participation.txt
final_project.txt                      Lab_assignments_participation.txt
Homework.txt                           syllabus.txt
[c177-i0@n2010 partial_documents]$ ls ../full_document/
course_assignments.txt  syllabus.txt
```

---

Wild cards are fun!  Say we now want to delete all of the text files in the partial directory  It can be done in a single command using a wildcard.

Before we get totally crazy lets just play with the wildcard ' * ' .

```
[c177-i0@n2010 partial_documents]$ ls *_*.txt
Do_first_Build_directory_exercise.txt  In_class_Participation.txt
final_project.txt                      Lab_assignments_participation.txt
[c177-i0@n2010 partial_documents]$ ls
Do_first_Build_directory_exercise.txt  In_class_Participation.txt
final_project.txt                      Lab_assignments_participation.txt
Homework.txt                           syllabus.txt
[c177-i0@n2010 partial_documents]$
```

What was not displayed when we used the wildcard.  Basically we looked for any file name that contained one underscore.  
\* = any characters
so ' \*\_\*.txt ' means  a file with any characters up to an ' _ ' followed and any characters up to a .txt

syllabus.txt does not match because it lacks an underscore.

Try ls \*\_\*\_\*

What was returned?
`Do_first_Build_directory_exercise.txt`  `Lab_assignments_participation.txt`
`In_class_Participation.txt`

We can use wildcards to cp, mv, ls, etc.  We will learn wildcards other than '\*' later.

Try to delete all of the text files from Lecture_1/syllabus/partial_documents/

---

---

Another useful command is "wc". It prints newline, word, and byte counts for each file.

Lets look at the basics of the files in full_document

```
[c177-i0@n2010 partial_documents]$ cd ../full_document/
[c177-i0@n2010 full_document]$ ls
course_assignments.txt  syllabus.txt
[c177-i0@n2010 full_document]$ wc *
   21   470  2896 course_assignments.txt
  339  4551 29370 syllabus.txt
  360  5021 32266 total
[c177-i0@n2010 full_document]$ wc
^C
[c177-i0@n2010 full_document]$
```
For course course_assignments.txt for example, wc gives us the number of lines = 21 the number of words = 470 and the number of bytes = 2896

__Note__: for Hoffman2 you need to use the wildcard to use wc on an entire directory.  I don't have to do this with my MAC

We can also just ask for the line counts

```
[c177-i0@n2010 full_document]$ wc -l *
   21 course_assignments.txt
  339 syllabus.txt
  360 total
[c177-i0@n2010 full_document]$ wc -l syllabus.txt
339 syllabus.txt
[c177-i0@n2010 full_document]$ wc -w syllabus.txt
4551 syllabus.txt
[c177-i0@n2010 full_document]$ wc -c syllabus.txt
29370 syllabus.txt
```
---

How do we transfer files from our computers to Hoffman2? You should already be able to do this using git.

There are several other ways to do this.  An easy one is through 'scp' but you need to be able to open a shell on your computer. The command is `scp [-r] path_source login_id@hoffman2.idre.ucla.edu:path_target` use -r if it is a directory rather than a file.

```
EMilys-MacBook-Pro-7:~ limeybean$ scp /Users/limeybean/Dropbox/UCLA_Spring_2019/Community_Ecology_2019/Community_Ecology_Syllabus_draft_1.txt c177-i0@hoffman2.idre.ucla.edu:Lecture_1/
c177-i0@hoffman2.idre.ucla.edu's password:
Community_Ecology_Syllabus_draft_1.txt        100% 1148    70.9KB/s   00:00    
```
It transferred successfully to hoffman2.

```
[c177-i0@n2010 Lecture_1]$ ls
Community_Ecology_Syllabus_draft_1.txt  syllabus
```

We can also download an SFTP client for a MAC or PC [like cyberduck](https://cyberduck.io/) or an app for [chrome](https://chrome.google.com/webstore/detail/sftp-client/jajcoljhdglkjpfefjkgiohbhnkkmipm?hl=en-GB).

We can also use Globus. See the [presentation](https://dechavezv.github.io/eeb_C177_2019//lecture_pdfs/week2_Lecture_Globus.pdf) on the course website.


Another useful way to get things to Hoffman2 is by using 'wget'.  wget is a non-interactive network downloader.  This means it downloads stuff from the internet to Hoffman2 or to your computer.

Lets first make a nested directory ~/week2_monday/wget_test/, then 'cd' into it.

We are going to download something from the internet into the new directory wget_test

```
[c177-i0@n2010 wget_test]$ wget ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/README.populations
--2019-04-07 15:45:10--  ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/README.populations
           => “README.populations”
Resolving ftp.ncbi.nlm.nih.gov... 130.14.250.13, 2607:f220:41e:250::13
Connecting to ftp.ncbi.nlm.nih.gov|130.14.250.13|:21... connected.
Logging in as anonymous ... Logged in!
==> SYST ... done.    ==> PWD ... done.
==> TYPE I ... done.  ==> CWD (1) /1000genomes/ftp ... done.
==> SIZE README.populations ... 1938
==> PASV ... done.    ==> RETR README.populations ... done.
Length: 1938 (1.9K) (unauthoritative)

100%[=============================================================================================>] 1,938       --.-K/s   in 0.008s  

2019-04-07 15:45:12 (236 KB/s) - “README.populations” saved [1938]

[c177-i0@n2010 wget_test]$ ls
README.populations
```
This file should contain the following text:

```
This describes the population codes which can be found in column 11 of the sequence
index file.

There are also two tsv files, which contain the population codes and descriptions for both the
sub and super populations

ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/20131219.populations.tsv
ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/20131219.superpopulations.tsv

And you can find PED files and fuller descriptions of all our samples and genders in

ftp://ftp.1000genomes.ebi.ac.uk/vol1/ftp/technical/working/20130606_sample_info/

CHB     Han Chinese              Han Chinese in Beijing, China
JPT     Japanese                Japanese in Tokyo, Japan
CHS     Southern Han Chinese    Han Chinese South
CDX     Dai Chinese             Chinese Dai in Xishuangbanna, China
KHV     Kinh Vietnamese         Kinh in Ho Chi Minh City, Vietnam
CHD     Denver Chinese          Chinese in Denver, Colorado (pilot 3 only)

CEU     CEPH    Utah residents (CEPH) with Northern and Western European ancestry
TSI     Tuscan Toscani in Italia
GBR     British British in England and Scotland
FIN     Finnish Finnish in Finland
IBS     Spanish Iberian populations in Spain

YRI     Yoruba Yoruba in Ibadan, Nigeria
LWK     Luhya   Luhya in Webuye, Kenya
GWD     Gambian Gambian in Western Division, The Gambia
MSL     Mende   Mende in Sierra Leone
ESN     Esan    Esan in Nigeria

ASW     African-American SW     African Ancestry in Southwest US  
ACB     African-Caribbean       African Caribbean in Barbados
MXL     Mexican-American        Mexican Ancestry in Los Angeles, California
PUR     Puerto Rican            Puerto Rican in Puerto Rico
CLM     Colombian               Colombian in Medellin, Colombia
PEL     Peruvian                Peruvian in Lima, Peru

GIH     Gujarati                Gujarati Indian in Houston, TX
PJL     Punjabi                 Punjabi in Lahore, Pakistan
BEB     Bengali                 Bengali in Bangladesh
STU     Sri Lankan              Sri Lankan Tamil in the UK
ITU     Indian                  Indian Telugu in the UK
~
~
~
~
~
(END)
```

Type the following into your browser:  `ftp://ftp.ncbi.nlm.nih.gov/1000genomes/ftp/README.populations`

Now lets get the Wikipedia page associated with the 1000genomes project.

```
[c177-i0@n2010 wget_test]$ wget https://en.wikipedia.org/wiki/1000_Genomes_Project
--2019-04-07 15:47:19--  https://en.wikipedia.org/wiki/1000_Genomes_Project
Resolving en.wikipedia.org... 198.35.26.96, 2620:0:863:ed1a::1
Connecting to en.wikipedia.org|198.35.26.96|:443... connected.
HTTP request sent, awaiting response... 200 OK
Length: 163413 (160K) [text/html]
Saving to: “1000_Genomes_Project”

100%[=============================================================================================>] 163,413     --.-K/s   in 0.04s   

2019-04-07 15:47:19 (4.00 MB/s) - “1000_Genomes_Project” saved [163413/163413]

```
Lets peak under the hood a little.

```
[c177-i0@n2010 wget_test]$ head 1000_Genomes_Project
<!DOCTYPE html>
<html class="client-nojs" lang="en" dir="ltr">
<head>
<meta charset="UTF-8"/>
<title>1000 Genomes Project - Wikipedia</title>
<script>document.documentElement.className = document.documentElement.className.replace( /(^|\s)client-nojs(\s|$)/, "$1client-js$2" );</script>
<script>(window.RLQ=window.RLQ||[]).push(function(){mw.config.set({"wgCanonicalNamespace":"","wgCanonicalSpecialPageName":false,"wgNamespaceNumber":0,"wgPageName":"1000_Genomes_Project","wgTitle":"1000 Genomes Project","wgCurRevisionId":890306653,"wgRevisionId":890306653,"wgArticleId":15993881,"wgIsArticle":true,"wgIsRedirect":false,"wgAction":"view","wgUserName":null,"wgUserGroups":["*"],"wgCategories":["Articles with short description","Wikipedia articles needing clarification from April 2015","Biotechnology in the United Kingdom","Genetics in the United Kingdom","Human genome projects","Science and technology in Cambridgeshire","Single-nucleotide polymorphisms","South Cambridgeshire District"],"wgBreakFrames":false,"wgPageContentLanguage":"en","wgPageContentModel":"wikitext","wgSeparatorTransformTable":["",""],"wgDigitTransformTable":["",""],"wgDefaultDateFormat":"dmy","wgMonthNames":["","January","February","March","April","May","June","July","August","September","October","November","December"],"wgMonthNamesShort":["","Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec"],"wgRelevantPageName":"1000_Genomes_Project","wgRelevantArticleId":15993881,"wgRequestId":"XKkIcgpAMFkAAKbzSgUAAAAO","wgCSPNonce":false,"wgIsProbablyEditable":true,"wgRelevantPageIsProbablyEditable":true,"wgRestrictionEdit":[],"wgRestrictionMove":[],"wgFlaggedRevsParams":{"tags":{}},"wgStableRevisionId":null,"wgCategoryTreePageCategoryOptions":"{\"mode\":0,\"hideprefix\":20,\"showcount\":true,\"namespaces\":false}","wgWikiEditorEnabledModules":[],"wgBetaFeaturesFeatures":[],"wgMediaViewerOnClick":true,"wgMediaViewerEnabledByDefault":true,"wgPopupsReferencePreviews":false,"wgPopupsShouldSendModuleToUser":true,"wgPopupsConflictsWithNavPopupGadget":false,"wgVisualEditor":{"pageLanguageCode":"en","pageLanguageDir":"ltr","pageVariantFallbacks":"en","usePageImages":true,"usePageDescriptions":true},"wgMFDisplayWikibaseDescriptions":{"search":true,"nearby":true,"watchlist":true,"tagline":false},"wgRelatedArticles":null,"wgRelatedArticlesUseCirrusSearch":true,"wgRelatedArticlesOnlyUseCirrusSearch":false,"wgWMESchemaEditAttemptStepOversample":false,"wgPoweredByHHVM":true,"wgULSCurrentAutonym":"English","wgNoticeProject":"wikipedia","wgCentralNoticeCookiesToDelete":[],"wgCentralNoticeCategoriesUsingLegacy":["Fundraising","fundraising"],"wgWikibaseItemId":"Q164786","wgScoreNoteLanguages":{"arabic":"العربية","catalan":"català","deutsch":"Deutsch","english":"English","espanol":"español","italiano":"italiano","nederlands":"Nederlands","norsk":"norsk","portugues":"português","suomi":"suomi","svenska":"svenska","vlaams":"West-Vlams"},"wgScoreDefaultNoteLanguage":"nederlands","wgCentralAuthMobileDomain":false,"wgCodeMirrorEnabled":true,"wgVisualEditorToolbarScrollOffset":0,"wgVisualEditorUnsupportedEditParams":["undo","undoafter","veswitched"],"wgEditSubmitButtonLabelPublish":true,"oresWikiId":"enwiki","oresBaseUrl":"http://ores.discovery.wmnet:8081/","oresApiVersion":3});mw.loader.state({"ext.gadget.charinsert-styles":"ready","ext.globalCssJs.user.styles":"ready","ext.globalCssJs.site.styles":"ready","site.styles":"ready","noscript":"ready","user.styles":"ready","ext.globalCssJs.user":"ready","ext.globalCssJs.site":"ready","user":"ready","user.options":"ready","user.tokens":"loading","ext.cite.styles":"ready","mediawiki.legacy.shared":"ready","mediawiki.legacy.commonPrint":"ready","mediawiki.toc.styles":"ready","wikibase.client.init":"ready","ext.visualEditor.desktopArticleTarget.noscript":"ready","ext.uls.interlanguage":"ready","ext.wikimediaBadges":"ready","ext.3d.styles":"ready","mediawiki.skinning.interface":"ready","skins.vector.styles":"ready"});mw.loader.implement("user.tokens@0tffind",function($,jQuery,require,module){/*@nomin*/mw.user.tokens.set({"editToken":"+\\","patrolToken":"+\\","watchToken":"+\\","csrfToken":"+\\"});
});RLPAGEMODULES=["ext.cite.ux-enhancements","site","mediawiki.page.startup","mediawiki.page.ready","mediawiki.toc","mediawiki.searchSuggest","ext.gadget.teahouse","ext.gadget.ReferenceTooltips","ext.gadget.watchlist-notice","ext.gadget.DRN-wizard","ext.gadget.charinsert","ext.gadget.refToolbar","ext.gadget.extra-toolbar-buttons","ext.gadget.switcher","ext.centralauth.centralautologin","mmv.head","mmv.bootstrap.autostart","ext.popups","ext.visualEditor.desktopArticleTarget.init","ext.visualEditor.targetLoader","ext.eventLogging","ext.wikimediaEvents","ext.navigationTiming","ext.uls.eventlogger","ext.uls.init","ext.uls.compactlinks","ext.uls.interface","ext.quicksurveys.init","ext.centralNotice.geoIP","ext.centralNotice.startUp","skins.vector.js"];mw.loader.load(RLPAGEMODULES);});</script>
<link rel="stylesheet" href="/w/load.php?lang=en&amp;modules=ext.3d.styles%7Cext.cite.styles%7Cext.uls.interlanguage%7Cext.visualEditor.desktopArticleTarget.noscript%7Cext.wikimediaBadges%7Cmediawiki.legacy.commonPrint%2Cshared%7Cmediawiki.skinning.interface%7Cmediawiki.toc.styles%7Cskins.vector.styles%7Cwikibase.client.init&amp;only=styles&amp;skin=vector"/>
<script async="" src="/w/load.php?lang=en&amp;modules=startup&amp;only=scripts&amp;skin=vector"></script>
[c177-i0@n2010 wget_test]$
```

Yikes let see what it should look like:  `https://en.wikipedia.org/wiki/1000_Genomes_Project`


# Monday Challenge pt 1
__HINT__ You will need to use hint use a redirect (e.g. '>') at each step.

Redirect the number of lines of the 1000genomes README.file to a file called ncbi_lines.txt

Redirect the number of lines of the 1000genomes wikipedia to a file called wiki_lines.txt

Concatenate these two files and redirect the text to a file called 1000genomes_lines.txt
