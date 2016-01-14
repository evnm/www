---
layout: post
title: "Introducing Armsible"
---

_**Update:** Since the publication of this article, Armsible projects
have since been folded into [Whisker Labs' GitHub organization](https://github.com/whiskerlabs)._

![ARM + Ansible](https://s3.amazonaws.com/whiskerlabs.com/img/armsible+logo.png)

Much ink has been spilled over the "Internet of Things". A consequence
of this trend is the rise of the
[single-board computer](https://en.wikipedia.org/wiki/Single-board_computer)
as a mainstream form factor for application development. With the
popularity of open source [[1]](#fn1) platforms like Raspberry Pi,
Arduino, and BeagleBoard, it's never been easier to build applications
that encompass both hardware and software.

However, there is less publicly-available material on how to
incorporate single-board computers into larger-scale deployments. A
typical use case involves someone using an ARM computer to monitor or
actuate devices in their home. The deployment workflow is more often
than not akin to a Linux server administered manually through SSH
sessions over the lifetime of the device. In contrast to the level of
automation fetishized in the software operations community, the state
of the art in the open source IoT space is remarkably unsophisticated.

In spirit, Armsible represents a call-to-action for the use of
industry-standard provisioning tools and techniques in embedded
applications [[2]](#fn2). Specifically, it is a collection of Ansible
roles and related tools that facilitate the automated deployment of
single-board computers.

## How do I use Armsible?

As of its unveiling, Armsible boils down to a few Ansible roles and
[a dynamic inventory script for targeting hosts on a local network](https://github.com/whiskerlabs/armsible/blob/master/local_network_inventory.py). The
initial use case is to provision a set of single-board computers on a
LAN.

Armsible's focused, albeit limited scope is a consequence of its
intended use in concert with other roles from the Ansible community. A
typical playbook for an embedded project will not be composed entirely
of Armsible roles. Configuration management for standard components
like [DNS](https://github.com/jdauphant/ansible-role-dns) is a solved
problem. Armsible fills the gaps between the needs of embedded
applications and the existing suite of roles from the wider community.

To that end, we'd like Armsible to be the home for the following:

* Roles for provisioning specific hardware platforms
(e.g. [Raspberry Pi](https://github.com/motdotla/ansible-pi),
[BeagleCore](https://www.kickstarter.com/projects/beaglecore/beaglecore-100-open-source-iot-device),
Intel Edison)
* Roles for installing and configuring software components that are
  needed by embedded developers but not currently covered by the open
  source Ansible community
  (e.g. [the kernel watchdog](https://github.com/whiskerlabs/ansible-watchdog),
  U-Boot, GPIO configuration)
* Tooling that enforces best practices for embedded development

## Why Ansible?

Ansible struck us as the right tool for the job because it is built
around vanilla SSH connections. For embedded devices that run
no-frills distributions of Linux, Ansible is much more applicable out
of the box than other tools that rely on less-ubiquitous transport
protocols and more-complicated topologies.

## How is Armsible organized?

Armsible is structurally inspired by [DebOps](http://debops.org/), a
collection of Ansible playbooks for Debian-based server
deployments. It comprises a number of Ansible roles stored as distinct
repositories within <s>an Armsible GitHub organization</s> Whisker Labs'
GitHub organization. These roles are published to Ansible Galaxy and
thus installable on the command-line with `ansible-galaxy`. A
[`bin` project](https://github.com/whiskerlabs/armsible) is provided
to house complementary tools (i.e. dynamic inventory scripts) to be
used in conjunction with Armsible roles.

## What plans exist for Armsible's future?

The project spawned from the hardware provisioning needs of products
developed at [Whisker Labs](https://whiskerlabs.com). As such, the
project's initial offerings are a sample of what we've developed so
far and are thus limited to the technologies we use.

Part of the intention behind open-sourcing this work is to foster a
community around IoT hardware provisioning. We encourage anyone
working in this space to take a look at Armsible and help make it more
useful. The best ways to get involved are by filing GitHub issues on
individual projects or joining the conversation in #armsible on
irc.freenode.net.

<section class="footnotes">
<p id="fn1">[1] The technologies in
question are "open source" to varying degrees, but vendors' overall
inclination towards open source is helping push the hardware world in
the right direction. For instance, the Arduino and
BeagleBoard/BeagleBone device families benefit greatly from the
tooling, documentation, and manufacturing ecosystem afforded by open
hardware design.</p>
<p id="fn2">[2] "Embedded" should really be in air quotes here, given
that we're talking about machines that run Linux. At the risk of
graybeards not taking me seriously, I'm going to roll with it.</p>
</section>
