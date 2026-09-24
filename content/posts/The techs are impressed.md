+++
date = "2026-09-21"
pubdate = "2026-09-21"
draft = "false"
title = "The techs are not impressed"
summary = "I wanted to prove to myself that I could get all this technology to mesh and surprisingly, it worked. "
description = ""
+++

The technologists who read this post will be unimpressed. But I'm pretty fkn proud of myself.

I'm not the sort of person who solves hard tech problems. However I got this simple website up and running in around 3 hours. The total annual cost is domain name renewal. Unlike Wordpress there's no hosting cost, no plugins, and theme subscription.

I like its super simple minimalist aesthetic and there's no tracking, nothing to buy, and nothing to do here. Except read.

It's fast, too. Google's PageSpeed tool ranks it 100/100.

## Here's what I did

1. I installed [Hugo](https://gohugo.io/) and [Github](https://github.com/) on my W11 PC.
2. I set up a [Cloudflare](https://www.cloudflare.com/) 'worker' service and pointed my existing domain to it.
3. I set up the folder structure Hugo produced as an Obsidian vault, and replicated it into a Github repository.
4. I installed the Hugo [Ed theme](https://themes.gohugo.io/themes/gohugo-theme-ed/), and tweaked it to what I wanted it to look like.
5. I created a couple of batch files. One sets up a localhost instance so I can see what it looks like. The other pushes Obsidian files to the Github repository - not all of them, I figured out .gitignore to leave some behind.

## Here's how it works

1. I think of a topic, or stumble across something interesting, and I write about it in Obsidian.
2. I adjust the Obsidian YAML to show excerpts, published date, title, etc.
3. The first batch file fires it up instantly on my PC so I check it all out.
4. All good. The second batch file writes it to Github.
5. 30 seconds later, the post is live.

I don't expect too many people out there will see this post or even this website. I don't care much. I just wanted to prove to myself that I could get all this technology to mesh, and it worked. Plus it gives me a space to practice writing in public.
