---
layout: post
title: "TTLs for Dropbox"
---

A bunch of friends and I have a Dropbox shared folder in which we swap files of various (legal) sorts. Most of the folks in the group aren't Dropbox zealots like myself who find ways to get 9+ GB for free. Thus the size of the directory in question becomes an issue as large forgotten files start to eat up others' precious 2GB of space.

As a solution to this problem, I wrote [a Node.js program](https://gist.github.com/1326602) that in essence lets you assign [TTLs](http://en.wikipedia.org/wiki/Time_to_live) to items within a Dropbox directory. It runs as a daemon and deletes any files older than a specified lifetime.

For example, to run a daemon that checks the directory `Dropbox/expirable-items` once a day for items that are older than a week, modify the variable declarations thusly:

{% highlight javascript %}
var dirToWatch = "expirable-items",
    ttl = 604800000, // 7 days
    interval = 86400; // 24 hours
{% endhighlight %}

The program depends on the log.js and dropbox Node modules:

    $ npm install log dropbox

Startup and delete events are logged to stdout, so redirect as you see fit:

    $ node app.js > dropbox-ttl.log
