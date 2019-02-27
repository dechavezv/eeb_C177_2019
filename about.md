---
layout: default
title: About
---
## About {{ site.name }}

![]({{ site.url }}/images/Emily_Curd.jpg)
<img class="user-avatar" src="{{ /images/Emily_Curd.jpg }}">  
Emily E. Curd PhD

This website correspond to the course **Practical Computing for Ecology and Evolution** at UCLA. The instructor of this course is Dr. Emily Cord and the Teaching assitance is Daniel Chavez.  

## Description of the course:
It is becoming easier to generate large volumes of biological data, however many biologists lack the skillsets to process and analyze this data.  In this class students will be introduction to fundamental skills needed for manipulation, analysis, and visualization of large data sets. Students will learn the basics of programming and scripting in Bash (Unix shell), Python, R. This will include text file manipulation via regular expressions and other related topics. Students will also learn common languages for document preparation (LeTeX and Markdown). Finally, students will learn how to use git and GitHub. You will also learn specialized libraries for programming in ecology and evolutionary biology.

<div class="pagination">
  {% if site.owner.linkedin %}
    <a href="{{ site.owner.linkedin }}" class="social-media-icons"><i class="fa fa-2x fa-linkedin-square" aria-hidden="true"></i></a>
  {% endif %}
  {% if site.owner.email %}
    <a href="mailto:{{ site.owner.email }}" class="social-media-icons"><i class="fa fa-2x fa-envelope-square" aria-hidden="true"></i></a>
  {% endif %}
  {% if site.owner.twitter %}
    <a href="https://twitter.com/{{ site.owner.twitter }}" class="social-media-icons"><i class="fa fa-2x fa-twitter-square" aria-hidden="true"></i></a>
  {% endif %}
  {% if site.owner.github %}
    <a href="{{ site.owner.github }}" class="social-media-icons"><i class="fa fa-2x fa-github-square" aria-hidden="true"></i></a>
  {% endif %}
</div>
