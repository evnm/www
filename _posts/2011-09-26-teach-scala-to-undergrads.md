---
layout: post
title: "Teach Scala to undergrads"
---

A symptom of Scala's growing popularity is the incessant discussion of its place in the bevy of industrial programming languages. This debate is often confusing, as both advocates and detractors of the language at times use the same argument in their favor: that Scala's complexity renders it unfit for use by the average developer. This talking point may generate votes on Hacker News, but it isn't remarkably productive at improving the state of software development.

People have been demonizing the rise of [JavaSchools](http://www.joelonsoftware.com/articles/ThePerilsofJavaSchools.html) for years and I believe Scala to be an effective countermeasure. It represents the perfect supplement to a programming languages course, with the ability to show students how powerful functional programming is when applied to "real world problems". As a single example, seeing how one can use higher order functions to avoid manual iteration through collections is enough to at least show students how much easier life can be with Scala.

{% gist 1239014 %}

I posit that the outlook of many students coming out of PL courses is akin to this continuum:

<img src="/images/pl-continuum.png" />

On one end you have "academic" languages like Haskell, ML, and Scheme which are interesting, but esoteric and impractical in that they're rarely used in production environments due to their difficulty. On the other are the common currency of most software developers: Java and C (and Ruby and Python within more hip circles). The languages on the right are influenced by the research that culminates in the languages on the left in the same way that mainstream musical artists say that they listen to Thelonious Monk and Stravinsky to get ideas.

Scala fits somewhere in the middle. It's a reasonably approachable language with a rapidly growing community and ample room for neckbearding. As proven by Foursquare, Tumblr, Twitter, Yammer, etc, Scala is a remarkable language for building the kinds of systems that CS students swoon over. After teaching ML, Haskell, or Scheme (WLOG), one could use Scala to show that many of the most expressive features of functional programming can be harnessed for use in a JVM language. Helping students connect the dots between imperative and functional programming would be a valuable lesson that many students don't fully understand.

More emphasis should be placed on experimenting with ways of raising the bar of the "average developer". While I agree with the sentiments behind the notion that Scala is ["too hard for a large portion of the Java community"](http://goodstuff.im/scala-use-is-less-good-than-java-use-for-at-l), this comes off as more of a statement about Java developers than about Scala. If Scala is going to be pigeonholed into strictly being for a higher class of programmer, then why not enlighten students in their formative years?

*Note: This argument could just as easily be made in favor of Clojure. The point is to experiment with improving the state of average instead of saying things are too hard.*
