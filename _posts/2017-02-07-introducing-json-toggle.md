---
layout: post
title: Introducing JSON Toggle
date: 2017-02-07
---

![](/images/json-toggle/rail-bw.jpg)

This post proposes _JSON Toggle_, a JSON document structure for
specifying feature toggles. This format is being used at
[Whisker Labs](https://www.whiskerlabs.com) with
[a Java 8 library](https://github.com/whiskerlabs/toggle) which we're
open-sourcing as a proof-of-concept for JSON Toggle.

## Background

[Feature Toggles](http://martinfowler.com/articles/feature-toggles.html)
(or feature flags) are a programming mechanism used to dynamically
configure running programs. A team utilizing feature toggles can
modify a software system’s behavior without having to redeploy code or
restart processes with new configuration. When used judiciously,
feature toggles can dramatically increase a team’s rate of
experimentation and delivery.

The state of a collection of feature toggles is typically read at
runtime from some side channel such as a database or a config
file. This state can be updated out-of-band with tooling (e.g. a
dashboard) and automatically distributed to running applications. At
Twitter (where I used to work), the company-wide feature flag system
provides the software equivalent of a railroad switching station,
giving teams dynamic control over which codepaths were enabled for
which users. This level of flexibility unlocks the ability to roll out
new features and perform
[large refactors](https://medium.com/turbine-labs/every-release-is-a-production-test-b31d80f2bc74#.gp6im5ad7)
with a minimum of pulled-out hair.

## A protocol for defining feature toggles

Since
[their emergence in the late aughts](https://code.flickr.net/2009/12/02/flipping-out/),
feature toggles have become a common pattern
[at](https://blog.travis-ci.com/2014-03-04-use-feature-flags-to-ship-changes-with-confidence/)
[internet](https://gmail.googleblog.com/2011/12/developing-gmails-new-look.html)
[companies](http://techblog.netflix.com/2013/11/preparing-netflix-api-for-deployment.html)
and have made their way into the
[enterprise](https://msdn.microsoft.com/en-us/magazine/dn683796). Despite
this, there has never been a successful effort to standardize the
means by which toggles are configured. By and large, the state of the
art has each organization building an implementation from scratch and
maintaining a bespoke distributed CRUD app to manage them.

__It’s shocking to me that there isn’t an equivalent of
[the statsd protocol](https://github.com/b/statsd_spec) for feature
toggles.__ Regardless of the storage and distribution mechanism used,
a protocol would at least allow us to converge on a standard for
specifying toggle configuration.

With this in mind, I’d like to propose __JSON Toggle__, a feature
toggle specification format that we’re starting to use at Whisker
Labs.

JSON Toggle defines a JSON document structure for parameterizing a set
of feature toggles. Such documents, called “toggle specifications”,
may be used to enact weighted probabilities that determine whether or
not a feature is enabled for a given request.


JSON Toggle is language-agnostic in the sense that ingestion libraries
may be implemented in any programming language.

## An example toggle spec

In the following example toggle specification, three toggles are
defined:

1. `"/feature/ab_test"` which acts as a simple coin-flip with 50%
   probability.
2. `"/feature/dogfood_widget"` which can be used to guard a feature
   that is 100% accessible to employees but inaccessible to all other
   users.
3. `"/feature/incremental_rollout"` which grants access to all
employees, but only 1% of non-employee users.

The spec looks like this:

{% highlight json %}
[
  {
    "key": "/feature/ab_test",
    "value": 5000
  },
  {
    "key": "/feature/dogfood_widget",
    "filter": [{
      "type": "cohort",
      "target": "employee",
      "value": 10000
    }],
    "value": 0
  },
  {
    "key": "/feature/incremental_rollout",
    "filter": [{
      "type": "cohort",
      "target": "employee",
      "value": 10000
    }],
    "value": 100
  },
  ...
]
{% endhighlight %}

Or equivalently in YAML:

{% highlight yaml %}
---
- key: "/feature/ab_test"
  value: 5000
- key: "/feature/dogfood_widget"
  filter:
  - type: cohort
    target: employee
    value: 10000
  value: 0
- key: "/feature/incremental_rollout"
  filter:
  - type: cohort
    target: employee
    value: 10000
  value: 100
{% endhighlight %}

For each specified toggle, an integer value from zero to 10,000
represents a probability (out of 10,000). These values can be thought
of as weights for predicates (boolean-valued functions) that are used
in application code to guard whether or not a feature is enabled for a
given request.

Toggles can additionally specify _filters_ which apply different
probability values to certain types of requests. For example, a filter
could be used to target a cohort of users, such as “employees” or
“beta testers”.

### Toggle Specification specification

An individual toggle definition is broken into three components:

- A required `key` string which uniquely identifies the toggle within
  the toggle spec.
- An optional `filter` property, defining a list of _filters_ which
  define “special case” branches of the toggle.
	- For instance, a _cohort filter_ is used to match a toggle
    invocation with a cohort. A cohort target could identify a subset
    of a userbase (e.g “employees”), an IP range of incoming requests
    (e.g. 67.174.128.0/24), or any other subdivision relevant to an
    application.
	- Filters should be evaluated in the order that they appear in the
    toggle specification.
- A `value` property, which sets the “base” value for cases when no
  filter applies to a request. Values are specified in
  [basis points](https://en.wikipedia.org/wiki/Basis_point) and define
  toggle probabilities out of 10,000. Thus a toggle value of 5,000
  will result in a toggle probability of 50%.

## A Java 8 library for working with JSON Toggle

In addition to this protocol, I’d like to share an early version of a
JSON Toggle ingestion library that we’re using at Whisker Labs for our
Java services. [toggle](https://github.com/whiskerlabs/toggle) is a
Java 8 library which implements the functionality described above
using `java.util.function` primitives.  It supports toggle
specifications stored in Amazon DynamoDB tables or JSON/YAML files,
and offers a caching decorator powered by
[Caffeine](https://github.com/ben-manes/caffeine).

With this library, we can do things like this:

{% highlight java %}
// Construct a caching `ToggleMap` backed by a DynamoDB table.
Table dynamoDbTable = dynamoDbClient.getTable("production-toggles");

ToggleMap<String, Integer> toggleMap = new CachingToggleMap<>(
  new DynamoDbToggleMap<Integer>(dynamoDbTable),
  "maximumSize=1000,expireAfterWrite=1m"
);

// Create a toggle backed by the "/feature/new_hotness" definition.
Toggle<Integer> fancyNewFeature = toggleMap.apply("/feature/new_hotness");

// Use the toggle to guard some new functionality, based on a user ID.
if (fancyNewFeature.test(user.userId)) {
  // New hotness.
} else {
  // Old and busted.
}

{% endhighlight %}

_Nomenclature unabashedly cribbed from
[Finagle](https://twitter.github.io/finagle/guide/Configuration.html#feature-toggles)._

## Now what?

If JSON Toggle is to become a thing, we'll need to write ingestion
libraries in other programming languages and various tools to make it
easy to manage with toggle specifications.

If you think this approach could be useful or that it’s a stupid idea,
I’d love to hear from you. In lieu of an official channel like a
mailing list, for the time being, please reach out
[via email](mailto:evan.meagher@gmail.com) or by filing an issue on
the [toggle project on GitHub](https://github.com/whiskerlabs/toggle).

---

*Thanks to [Rishi Ishairzay](https://twitter.com/rishair) for reading
and providing feedback on drafts of this essay.*
