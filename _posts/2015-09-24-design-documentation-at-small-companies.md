---
layout: post
title: "Design documentation at small companies"
---

![](/images/cartographer.jpg)

One component of the engineering culture at Twitter (where I used to
work) that I'm trying to instill at
[my new job](https://whiskerlabs.com) is the importance of writing
design documents prior to implementing complicated systems. In this
essay, I will argue in favor of premeditated software design at small
companies and propose what I call &#8220;precautionary migration
planning&#8221; as a design doc section that caters specifically to
the tradeoffs required by startups.

## Traveling by map

A design document is an outline of a proposed design for a software
system in writing and figures. The level of detail and formality can
vary, but the purpose is to force an engineer to think about and
document what a system should do and how it should be built before
effort is spent on implementation.

Many large companies enforce design docs for all new projects, going
so far as to prescribe document templates and design review
meetings. While such a formal approach makes sense when projects
require
[coordinated effort](/2014/06/coordinating-technological-change-in-large-software-organizations/)
across multiple teams and scores of people, it would be an
inappropriate amount of overhead for an engineering team at a startup.

But the baby shouldn't be thrown out with the bathwater. Writing down
and examining your thoughts prior to acting on them is a good way to
avoid mistakes and prevent unwarranted
[technical debt](/2013/06/survey-on-technical-debt-management/). As
such, even at a startup, going through a semi-formal design exercise
injects a healthy amount of peer-review into the process and can
increase the reliability of the systems you end up with. Not to
mention the added benefit of having a good understanding of a
project's scope and thorough high-level documentation prior to writing
a single line of code. Ideally, when you bring new folks onto the
team, you can simply link them to a set of design docs and save
yourself an hour of whiteboarding.

A straightforward analogy helps illustrate when a design doc is
appropriate for a new undertaking. A design doc is like a set of
directions and a map. The complexity of a journey determines whether
or not directions are required. For instance, you can walk up the road
to the grocery store without thinking, so you obviously don't need a
map. Similarly, if all you need to do is add a simple feature or fix a
simple bug, then a rigorous design process is probably unnecessary.

However, for trips venturing into unfamiliar territory or requiring
multiple vehicles, coordinating travel with a set of directions is a
must. Likewise, if a system at the core of the company's business has
many moving parts and will affect the lives of numerous people over
its lifetime, then a design doc will probably prove to be worthwhile.

## External dependencies

After writing the first couple design documents at Whisker Labs, I've
noticed a key difference between what I'm writing now and those I
wrote at Twitter. Critically, the former tend to rely on the
availability of services maintained by unfamilar people at other
companies rather than acquaintances down the hall. For instance, by
making use of Amazon Web Services instead of
[technologies stewarded in-house](https://blog.twitter.com/2015/all-about-apache-aurora),
our services' uptime is reliant on the diligence of anonymous Amazon
personnel. As the swashbuckling systems cliché goes,
[you own your availability](http://www.whoownsmyavailability.com/),
but you aren't in control of all of the factors from which it derives.

Strategies exist for managing the impact of _intermittent_ outages of
third-party services. RPC interactions can be augmented with features
like retries and failure accrual, or can simply return partial results
as a means to limit the damage caused by temporary downtime. But at a
higher level, years of experience with as-a-service offerings have
shown that there is typically a threshold scale beyond which any given
hosted service ceases to be economical. What we've observed is that
almost all companies who bootstrap their software atop
whatever-as-a-service solutions eventually move away from them on
account of cost, reliability, and/or functionality. In the long term,
everybody ends up running their own Graphite and Kafka clusters and
the luckiest of us get our own datacenters.

Not to mention the trend of services simply disappearing out from
under you, on account of the originating company
[being acquired or otherwise going out of business](http://www.economist.com/news/business/21665070-flock-startups-making-cloud-computing-faster-and-more-flexible-most-them-will).

But for a scrappy, bandwidth-constrained startup team, paying someone
to do the heavy lifting of distributed systems operation is a
no-brainer.  So what does a responsible software engineer do in such
cases when business and productivity concerns demand the usage of
hosted services regardless of their long-term feasibility?

## Precautionary migration planning

The easy (and industry-standard) answer is to throw up your hands and
say &#8220;we'll cross that bridge when we get there.&#8221; The pricing and
long-term viability of external services is entirely out of your
control, so why worry about hypothetical futures that you can't
influence? People still live in Seattle and Portland even though the
mega-quake is coming, right?

This is a fine answer if you've made the conscious decision that your #1
priority as an engineering organization is speed of
execution. Depending on your product or service's reliability
requirements, the pace of your market, and your bottom line, it very
well may be preferable to put your time to more immediately productive
use than planning for eventualities.

On the other hand, deciding which failure modes are worth planning for
is part of what makes engineering interesting. The best you can do to
minimize the risk imposed by external dependencies is to come up with
a feasible (but brief) plan for migrating away from them. Consider it a
[precautionary principle](https://en.wikipedia.org/wiki/Precautionary_principle)
for SaaS.

This is why I'm starting to bake such a section into the design docs
that I'm writing. They follow the same principles of situational
awareness and premeditated action that motivates having runbooks for
services, but are more akin to a heart transplant than a simple
runbook item. The sections will:

- List the system's external dependencies whose long-term feasibility
  is deemed at risk (i.e. &#8220;_&lt;PaaS&gt; will be too expensive by
  the time we hit &lt;milestone&gt;_&#8221;)
- List potential replacements for the risky dependency and give a
  high-level plan for migrating

The result of this exercise is a better understanding of a system's
risk profile and the paths by which the system is likely to evolve
over time.

## Countering the logical conclusion

In response to my initial thoughts on this strategy on Twitter, an
esteemed former colleague
[pointed out](https://twitter.com/evan/status/646538301181194241) its
logical conclusion, in which the list of &#8220;hosted services&#8221;
is exhaustive. In literal terms, a program's &#8220;external
dependencies&#8221; include the operating system and proprietary
hardware on which it runs, all the way down to the utility company
that supplies the energy powering the computer. In this light,
precautionary migration planning is absurd, given that the engineering
effort involved in reinventing every wheel between your program and
electrons in circuits is well beyond most companies' capabilities.

However, I don't think that this argument refutes the usefulness of
such planning. When done pragmatically, focusing on a reasonable
subset of a system's dependencies, a team gains the ability to act
quickly when migrations are deemed necessary.

One way to differentiate external dependencies is by whether or not
they are truly fundamental to a service's operation. If the power goes
out, a program (or at least a stricken instance thereof) is
unrecoverable regardless of any migration plan. Thus such planning is
only relevant for _partial_ failure modes, such as the loss of a
hosted database or the end-of-LTS for a specific operating system
version.

## Conclusion

Even small ships carry maps. I've made a case for the use of design
documents at startups, but a key takeaway is that their use varies
from organization to organization. For some businesses, time spent
planning for hypothetical futures is not time well spent. For others,
it's a valuable hedge against undesirable outcomes.

Experience has shown that once an engineering organization reachs a
certain size, a reasonably-rigorous design process is well worth
having in place. A startup team's habits tend to ossify into company
culture, which is motivation to start thinking about a team's design
process early. Even if you decide against design documentation in the
early stage of your company, going through the mental exercise of
considering its implications will increase your team's operational
awareness.

*Thanks to [Marcel Molina](https://twitter.com/noradio) and
[Gary Tsang](https://twitter.com/garru) for reading and providing
feedback on drafts of this essay.*
