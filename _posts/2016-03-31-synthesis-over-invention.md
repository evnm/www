---
layout: post
title: "Synthesis over invention"
date: 2016-03-31
---

![](/images/synthesis/gottingen_library.jpg)

I recently finished a great book called
[_Hilbert_](https://www.goodreads.com/book/show/1217018.Hilbert) [1],
an eponymous biography of the mathematician David Hilbert. It's a fun
read and conveys an important message for anyone who strives to be
creative in a technical field. In contrast to the stereotype of the
inventive genius who advances a field by creating fundamentally new
concepts, many of
[the innovations to which Hilbert's name is attributed](https://en.wikipedia.org/wiki/List_of_things_named_after_David_Hilbert)
are instead examples of _synthesis_, or the process of combining
different existing theories into a single system.

This is a critical distinction which I don't feel is emphasized enough
in the contemporary software development and computer science
community.

## Nerd nostalgia

Beyond capturing the life of an intellectually preeminent man, author
Constance Reid does a fabulous job of snapshotting the energy and
unprecedented output of the mathematical society centered around
[Göttingen](https://en.wikipedia.org/wiki/University_of_G%C3%B6ttingen),
Germany at the turn of the twentieth century.

If you were to trace the lineage of virtually any subfield of modern
mathemathics or physics, Göttingen would stand out as an inexorable
nexus of theory and innovation. Any subset of
[the list](https://en.wikipedia.org/wiki/List_of_Georg-August_University_of_G%C3%B6ttingen_people)
of folks who passed through would be an intellectual hall of fame:
Gauss, Riemann, Dirichlet, Born, Oppenheimer, Teller, Dirac, Planck,
Einstein, Noether, Klein, Schopenhauer, Fermi, von Neumann,
Heisenberg.

Up there with the Manhattan Project and
[Bell Labs in the 70s](http://www.sexmagazine.us/articles/laurie-spiegel/1),
Göttingen is one of the storied valhallas of nerd nostalgia. Every few
decades since the industrial revolution (and before, but with far
lesser frequency), some cloistered organization attracts a critical
mass of productive brain power and is canonized in history books as a
hotbed of R&D. The Georg August University of Göttingen was one such
place from its heyday in the mid-19th century up until the German
braindrain of the 1930s. Add to this the era of geopolitical
turbulence overlapping Hilbert's lifetime, and you're left with a
fascinating slice of history.

## A synthetic character

In the wake of this book, I'm left ruminating over certain
characterizations of Hilbert's work and the historical setting in
which he lived. One particularly compelling specialty that Hilbert
possessed was an ability to synthesize disparate concepts into
cohesive theories that at once fundamentally broke ground and unified
different fields.

Hilbert's student and fellow mathematician, Otto Blumenthal:

<blockquote>
<p>&#8220;For the analysis of a great mathematical
talent, one has to differentiate between the ability to create new
concepts and the gift of sensing the depth of connections and
simplifying fundamentals. Hilbert's greatness consists of his
overpowering, deep-penetrating insight. All of his works contain
examples from far-flung fields, the inner relatedness of which and the
connection with the problem at hand only he had been able to discern;
from all these the synthesis &mdash; and his work of art &mdash; was
ultimately created.&#8221;</p>
<cite>C. Reid, <em>Hilbert</em>, 1st ed. New York: Copernicus, 1996,
ch. 24, pp. 208.</cite>
</blockquote>

To paraphrase, Hilbert is best known not for inventing lots of
fundamentally new science, but for finding and leveraging
commonalities between the many good things that his contemporaries
came up with. Rather than endlessly adding to an intractable pile of
mathematical novelty, Hilbert excelled at _synthesis_, or the process
of combining different theories into a single cohesive system.

In an ambitious age of unbounded possibility and imagination, what
better strategy than to seek _depth of connections and simplifying
fundamentals_.

## Wherein software eats my book report

This notion has important and obvious lessons for software
developers. The existential balance between novelty and synthesis in
theoretical mathematics is equivalent to maintaining a balanced diet
of abstraction in a computational system.

For example, I would go so far as to say that there is a trend in
certain niche programming language communities to culturally
appropriate as much from the fields of modern mathematics as
possible. This has several adverse consequences, most immediate of
which is the imposition of an immense educational burden on
newcomers. Longer term, when projects are built around arcane
abstractions that few people truly understand, they are inevitably
used &#8220;improperly&#8221; because consumers don't know any better.

[I think](https://twitter.com/evanm/status/714521881387204608) that
the degree to which a project exposes overly-conceptual abstraction is
directly related to the rate at which technical debt accumulates in
consuming code. Such cases do all of us a disservice and lead to the
eventual marginalization of the abstraction-laden technology.

To me, it's interesting to think about where the pendulum of creation
vs synthesis currently lies in the world of software development. We
are awash in heady topics that we collectively feel remiss for not
understanding well enough. From elliptic curve cryptography to block
chains to consensus protocols to region-based memory management to
whatever the hell a monad actually is, there are an increasing number
of gaps in our domain expertise and few unifying systems through which
to understand them.

I get the feeling that lately we as an industry put too much emphasis
on novelty and not enough on unification. We are easily titilated by
the newest programming language or the latest gizmo that can fork a
process on a far away computer and less interested in ideas that
fundamentally simplify how we reason about and work with computers.

## Towards synthesis

I'm humbled by Hilbert's definitive ability to consolidate and
simplify. Read by a software developer, the book is a call to action
pitting the goal of synthesis against our tendency to run as fast as
we can in a million directions at once.

By emulating David Hilbert and studying disparate fields with an eye
towards unification, we can produce powerful tools without requiring
that our users read 40 whitepapers before understanding anything.

---

*Thanks to [Rishi Ishairzay](https://twitter.com/rishair),
[Marcel Molina](https://twitter.com/noradio), and
[Arya Asemanfar](https://twitter.com/a_a) for reading and providing
feedback on drafts of this essay.*

---

<section class="footnotes">
  <h2>References</h2>
  <ol>
    <li>C. Reid, <em>Hilbert</em>, 1st ed. New York: Copernicus, 1996.</li>
  </ol>
</section>
