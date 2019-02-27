---
layout: post
title: "Using Python and the Shell"
date: 2014-05-01 14:05:26 +0530
comments: true
---

Lets learn some basic about **SHELL** scripting

## For loops
{% highlight shell %}

for i in 1 2 3 4 5
do
echo $i
done
{% endhighlight %}


## Funtions

{% highlight shell %}
function takebackup (){
        if [ -f $1 ]; then
        BACKUP="/home/aravi/$(basename ${1}).$(date +%F).$$"
        echo "Backing up $1 to ${BACKUP}"
        cp $1 $BACKUP
        fi
}
{% endhighlight %}

## If Staments

{% highlight shell %}
echo -e "Enter any value> \c"
read -r a
echo -e "Enter any value: \c"
read -r b

if [ $a -gt $b ]; then
echo "$a is greater than $b"
else
echo "$b is greater than $a"
fi
{% endhighlight %}



takebackup /etc/hosts
        if [ $? -eq 0 ]; then
        echo "BAckup Success"
        fi
function testing (){
echo "Just TEsting Function"
}
`
Last year, I read a great book on Programming and development (The Pragmatic Programmer).
Here is a gist of checklist you must do in case you are developer. These are very good
and for sure will help you evolve as a better developer.


<script src="https://gist.github.com/vinitkumar/55ef44f759b7e5620d59.js"></script>
