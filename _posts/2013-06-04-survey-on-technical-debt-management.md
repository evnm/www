---
layout: post
title: "Survey on Technical Debt Management"
---

First coined by [Ward Cunningham in 1992](http://dl.acm.org/citation.cfm?id=157715), the concept of "technical debt" is widely known within the software engineering community. It evokes other colloquialisms such as "code rot", "cruft", and "kludge". The word "hack" is often used synonymously, but its usage is now overloaded and popularized to the point of meaninglessness. From his keynote presentation at the [2013 International Workshop on Managing Technical Debt](http://www.sei.cmu.edu/community/td2013/program/?location=secondary-nav&source=718317), Steve McConnell (of Code Complete fame) provides a good working definition of technical debt:

<blockquote>
<p>A design or construction approach that's expedient in the short term but that creates a technical context in which the same work will cost more to do later than it would cost to do now.</p>
<cite><a href="http://www.sei.cmu.edu/community/td2013/program/upload/TechnicalDebt-ICSE.pdf">Steve McConnell, <i>Managing Technical Debt</i></a></cite>
</blockquote>

A sizable portion of the work done by my team at Twitter classifies as paying down technical debt. This is by no means meant as a negative. The performance gains from transitioning a Rails-based infrastructure into [an ecosystem of JVM services](http://blog.oskarsson.nu/post/40196324612/the-twitter-stack) have been gratifyingly enormous and the work itself is intellectually enriching. However, dealing with technical debt is generally considered to be undesirable in favor of feature development.

This sentiment is totally understandable. Greenfield work is sexy and fits the trope of the lone hacker cranking out code, fueled by caffeine and the Social Network soundtrack. The harsh reality is that when you're working on systems of any meaningful scale, building in isolation is rare. There will always be dependencies, requirements, or even simply code you wrote two weeks ago that gets in your way.

Technical debt is a natural part of the software development process, and is thus unavoidable. There exist software anti-patterns that produce predictable debt, as codified in Michael Duell's [Resign Patterns](http://www.fsfla.org/~lxoliva/fun/prog/resign-patterns). Through awareness and internalization of sanitary development techniques, one can prevent certain classes of technical debt from occurring in the first place. But for the inevitable cases when it falls through the cracks, a manageable strategy is to be mindful of the debt as it accumulates and to periodically make a concerted effort to pay it down.

## Mindfulness toward technical debt

Just as with financial debt, there are multiple classes of technical debt with varying levels of insidiousness. There is "high interest" debt that will waste countless future hours of work. An example of this would be an inconsiderate choice of framework, resulting in great expense to port to a different system later on. In contrast, an item of low interest debt could be putting off writing a class's test suite until after a milestone. If paid down soon after being taken on, this type of debt can be acceptable. However as low interest debt piles up, both in quantity and lifetime, it is increasingly dangerous and more onerous to deal with. If a development team is diligent about avoiding high and reducing low interest debt, they will be much more effective at reaching goals and staying productive in the long term.

Another axis on which to characterize debt is whether or not it's taken on intentionally. Teams accrue intentional debt by making conscious decisions about the feasibility of their being able to handle the debt load later on. "We need to ship this feature ASAP, so let's skip these tests until our next sprint."

Unintentional debt is taken on carelessly, either by individuals' actions or institutional change. On the level of an individual, a junior developer or contractor could introduce changes that render a system less maintainable. Depending on the complexity of the problem, code review is an effective preventative measure for these situations. Harder to deal with are large-scale events that inadvertently introduce vast tracts of debt. For example, the integration of an acquired company's codebase or a coordinated refactor could leave a system in a less tenable state than it was before. There is no one-size-fits-all solution for such cases and they exemplify the importance of remaining mindful of debt accumulation.

In addition, it is important to *track* debt. With a log of specific debt items, a team can assess their debt load at any point and act accordingly. Without one, they are blindly flying into a minefield, condemned to endlessly fit square pegs into round holes. There is no way to reasonably fix the unmeasured quantity.

## Planned payment of technical debt

Once a team locks down the rate at which they accumulate debt and makes a concerted effort to avoid the high-interest kind, paying down what remains is much more straightforward. From there, it's simply a matter of prioritizing items in the debt log and chipping away at them.

The application of positive habit formation tactics can be very effective here. Just as someone wanting to get in better shape can explicitly plan gym visits into their schedule, software development teams can plan debt-reduction periods into your release cycles. This can take many forms, depending on the temperament of the team:

* Baking debt-repayment into the sprint cycle. (e.g. devoting a portion of each sprint or one entire sprint per month/quarter to tackling items on the debt log)
* Having a debt-reduction rotation wherein individuals focus on debt during their duty cycle.
* Spinning out debt-reduction into its own project with a separate pool of resources. I'm admittedly skeptical of this approach. It seems to be analogous to a garbage collection problem, in which a mutator (the development team) is continuously introducing work items to be fixed by a collector (the debt-reduction squad). This is theoretically feasible if debt introduction is kept at a reasonable rate, but the division seems unmanageable to me.

## Conclusion

McConnell's viewpoint is abstract and arguably too high level to be of much use for certain development teams. The strategy presented here meshes well with what I've experienced at Twitter, but I admittedly may be writing from a BigCo stance. It's been [pointed out](https://gist.github.com/evnm/30617c34575872d3b60d#comments) that McConnell's principles don't necessarily suit the realities of smaller companies. It would be interesting to examine this statement in another post, focusing on debt accumulation and fallout as companies grow.

Technical debt is often preventable, but an inevitable part of the software development process. As much as it hurts one's pride to hear it, everyone writes unthoughtful code some of the time. In order to keep systems maintainable, teams must adopt a strategic approach to controlling the rate at which debt accumulates, tracking the specific items that are deemed short-term-acceptable, and paying them down. Through this, a team can avoid much of the productivity and morale degradation associated with technical debt buildup.

If you find this topic interesting, I would encourage you to read through [McConnell's slides](http://www.sei.cmu.edu/community/td2013/program/upload/TechnicalDebt-ICSE.pdf). My notes on the slides are available in [this gist](https://gist.github.com/evnm/5695408).

*Thanks to [Trevor Bramble](https://twitter.com/trevorbramble), [Mike Bernstein](https://twitter.com/mrb_bk), and [Richard Bailey](https://twitter.com/falun) for reading and providing feedback on drafts of this post.*
