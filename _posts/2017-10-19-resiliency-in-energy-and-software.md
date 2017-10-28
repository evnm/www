---
layout: post
title: Defining resiliency in energy and software
---

![](/images/resiliency/ali_frazier.jpg)

The word "resiliency" is all the rage right now.

The notion of resiliency is uniquely applicable in a _systems_
context. Specifically, it is a desirable feature of any system that is
made up of many moving parts that operate in a distributed,
coordinated fashion.

In such systems, failure is an inevitability that must be planned
for. Whether you're talking about an electricity grid or a network of
software services, the study and construction of distributed systems
necessarily entail having to worry about component failure. Planning
for failure and designing [systems](/2017/02/systems-thinkpiece) to be
able to mitigate its impact is at the core of resiliency.

To study the implications of this mindset, let's take a look at how
resiliency is defined in the electricity generation, transmission, and
distribution industry.

## Setting the stage

Within the US energy sector, a debate is raging
among
[industry analysts](https://www.greentechmedia.com/articles/read/microgrids-hurricanes-resiliency),
[regulators](https://arstechnica.com/science/2017/08/energy-departments-contentious-baseload-study-is-out/),
and vendors on the degree to which renewable energy resources
could
[wreak](https://www.greentechmedia.com/articles/read/rick-perry-congress-doe-coal-nuclear-cost-freedom) [havoc](http://thehill.com/policy/energy-environment/355673-conservative-think-tank-plan-to-help-coal-nuclear-power-arbitrary) on
our electricity grid. On the one hand, proponents of the status quo of
subsidized fossil fuels and centralized power generation are sowing
fear that intermittent solar and wind generation will cause brownouts
and systemic failures. Countering this narrative is a growing pile of
research and field evidence that indicate that the distributed nature
of renewables—and particularly the one-two punch
of
[solar-plus-storage](http://www.utilitydive.com/news/is-the-future-finally-here-for-utility-scale-solar-plus-storage/449496/)—will
make the grid _more_ resilient to systemic failures.

These terms (reliability, resiliency) are
also [all the rage](https://landing.google.com/sre/) in the software
industry. In fact, if you blur your eyes a little and think abstractly
about the systems involved, recent trends in software architecture
look strikingly similar to those in the renewable and distributed
energy resource space.

![](/images/resiliency/centralized_vs_distributed_energy_and_data.png)<span
 class="figure_caption">Fig. 1. Centralized vs distributed
 architectures of power and data generation, transmission, storage,
 and consumption.</span>

The last couple of decades saw similar arcs in the trajectories of
SaaS-/IoT-era software stacks and renewable energy resources. In place
of relying on big, centralized resources, we're seeing more use of
distributed resources. Analogous to the onslaught of microservices and
smart devices, the future of the energy grid lies in energy harvested
from solar panels
or [demand response](https://en.wikipedia.org/wiki/Demand_response)
providers, and stored
in
[batteries](http://news.mit.edu/2016/battery-molten-metals-0112),
[cars](https://www.tesla.com/model3), or
even
[water heaters](https://www.greentechmedia.com/articles/read/the-water-heater-as-grid-battery-version-2-0).

## Defining reliability and resiliency

In my experience in the software industry, "resiliency" is one of
those whizbang words that's fun to throw around, but remains generally
ill-defined. Often, reliability and resiliency are used by executives
to describe effort spent paying down technical debt.

<table class="table-bordered">
  <thead>
    <tr>
      <th class="col-sm-4">What is said</th>
      <th class="col-sm-8">What is meant</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td class="col-sm-4">"We're going to focus on reliability this quarter."</td>
      <td class="col-sm-8">"I'm getting flak from customers/investors about our app not working, so I want you to fix bugs, reduce latencies, and increase success rates, potentially at the cost of timely feature development."</td>
    </tr>
  </tbody>
</table>

By comparison, these terms are very precisely [defined](https://ics-cert.us-cert.gov/sites/default/files/ICSJWG-Archive/QNL_MAR_16/reliability%20and%20resilience%20pdf.pdf) and [measured](http://prod.sandia.gov/techlib/access-control.cgi/2017/171493.pdf) in the electric power industry.

<blockquote>
  <p>For the electric sector, reliability can be defined as the
  ability of the power system to deliver electricity in the quantity
  and with the quality demanded by users. (…) Reliability means that
  lights are always on in a consistent manner.</p> <cite>Aaron
  Clark-Ginsberg, <a
  href="https://ics-cert.us-cert.gov/sites/default/files/ICSJWG-Archive/QNL_MAR_16/reliability%20and%20resilience%20pdf.pdf"><em>What’s
  the Difference between Reliability and Resilience</em></a></cite>
</blockquote>

In this light, reliability is binary along the time dimension—your
thing either works under a given set of conditions or it
doesn't. These conditions are typically defined in a service-level
agreement (SLA), which a service is charged with adhering to over
time.

![](/images/resiliency/stripe_status.png)<span
 class="figure_caption">Fig. 2. Screenshot
 from [Stripe's system status dashboard](https://status.stripe.com/),
 which is used to signal whether or not their systems are functioning
 properly.</span>

Resilience is more complicated.

> Resilience, stemming from the root _resilio_, meaning to leap or
> spring back, is concerned with the ability of a system to recover
> and, in some cases, transform from adversity.

Clark-Ginsberg's report goes on to say that "resilience operates from
a systems perspective, understanding incidents as a complex process
occurring at the intersection of natural and human forces across
multiple scales, evolving and changing over time."

Reliability and resiliency, while related, are fundamentally different
attributes. Resilience involves the gray area of partial failure, as
in the case of a rolling brownout or a broken widget on an
otherwise functional web page. It implies thinking of a service as a
system of constituent components, with too many moving parts to be
reasonably characterized using a simple "does it work or not" rubric.

## We aren't so different, you and I

With respect to the nature of renewable energy and software systems,
it's not a coincidence that both can be characterized as distributed
systems or that both lend themselves towards discussions of
resiliency.

In both cases, intermittent and composable resources require thinking
about a service as a distributed system. Part of distributed systems
theory and practice is the notion that failure is inevitable, and thus
the topic of being resilient to failure is paramount.

*Thanks to [Oren Schetrit](https://www.linkedin.com/in/oschetrit)
and [Berk Demir](https://twitter.com/bd) for reading and providing
feedback on drafts of this essay.*
