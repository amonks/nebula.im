# Gallery Directory: New Media Project Paper

by [Andrew Monks](http://monks.co)

updated 12/5/13

written on a Raspberry Pi

## Intro: Illegal Art

Chicago has historically had a plethora of artist-run gallery spaces[1]. In today's Chicago, the hardest part of running a gallery isn't publicity, it isn't finding talent, but often maintaining legality. Operating a legal gallery event space can cost a prohibitively large amount of money, especially when galleries try to support themselves by selling alcohol at their events. Because of this, artist-run gallery spaces are, for the most part, technically illegal ventures. In order to avoid legal drama, gallery managers try to act as legit as possible and try to avoid attention. Because of this, Chicago's artist-gallerists tend to have a healthy fear of the press. 

One gallerist I spoke to believes that there's no possible benefit to publicity: because the gallery targets a niche, anyone sufficiently interested in that niche to attend an event already knows about the space, therefore it's not valuable to try to gain exposure to a larger audience. Another long-time gallerist went so far as to say that they owe their long-term succes in large part to the fact that they've never appeared in a major publication or directory. To me, this seems preposterous. Perhaps because I am a product of the internet-influenced worldview that a niche market can achieve an audience by producing high-quality content, engaging with fans, and marketing effectively.

Because of these difficulties, mounting above and beyond the inherent difficulties of operating a successful small business, and certainly not reduced by Chicago's unusually large population of transient student artists, a huge majority of Chicago's artist-run spaces are only active for a few years. Only a tiny few have been around for a long time.

[1]: http://www.mcachicagostore.org/main/item_detail.php?pid=3039&cat=1&sub=32 "Alternative Spaces: A History In Chicago (MCA Store)"

## The problem

Maybe I'm young and naive, but I believe the internet has created a lot of passive fans. People who are interested in a thing (art, in this case) but come from outside the community in which that thing is made // displayed // experienced. Imagine an online art fan with no personal ties into the Gallery Scene. Multiple gallery owners told me I'm delusional, but I believe it's possible (and desirable) to convert these passive fans -- to lure them to real-life events. I believe many art students share my view, but one more traditionally established gallery operator implied that this art-student-view is more of a nuisance than anything: held by uncommitted short-term gallerists, but against the interests of the Serious Gallery Scene.

As one of these uncommitted short-term gallerists, I believe that there's tons of room for improved online accessibility / marketing to bring value and exposure to young artists and to small-scale, d.i.y. art events. I'm creating an online directory, a la The Visualist[2]. I'll go more specifically into the differences later, but the main differentiator is that The Visualist relies on gallery runners to submit their events via email, my directory uses an extensible web scraping system to automatically update itself with new events from gallery websites, calendars, and Facebook pages. Additionally, it allows gallery operators, artists, and fans to add events to the directory using a standard API.

Because of the established mindset I discussed earlier, which I can only see as entrenched cynicism, several of the gallerists I spoke to felt that an open directory--where an event might be added whether or not the gallery wanted it to be--was not in the best interest of the art community. One quite-well-established anonymous gallery operator went so far as to say that I would "destroy the art world."

As part of an earlier incarnation of this project, I solicited a number of successful apartment gallery owners for advice that young artists trying to start showing work could benefit from; especially tips about how to avoid legal trouble. While some artists were more forthcoming than others, nobody I spoke to was willing to go on the record for an online resource. The consensus was that publicizing the tricks of an illegal trade would make law enforcement less likely to fall for those tricks. Encouragingly, I believe they'd be more willing to share directly with a person trying to open a space, rather than someone like me seeking to publish.

[2]: http://thevisualist.org "The Visualist"

## The solution

You already know I'm making a directory of events at artist-run and alternative spaces in Chicago. Here's how I'm doing it. Most of this is more-or-less directly copped from my project proposal, but here goes. 

### Database

My first step is to set up the database//schema itself. While I'm tempted by a trendy nosql solution, I think the most economical move is to go with a free Postgres instance hosted by Heroku. Since (at least for now) I'll be the only person *writing* to the database, and my needs in terms of row count are pretty light, I don't anticipate reaching the limits of the free plan in the near future.

### API - Sinatra//Rack (heroku)

I'm going to write the API itself using Sinatra. I'd take the opportunity to get more familiar with node.js, but since the huge majority of the effort required by this project will be in the data acquisition I'd rather stick with a tool I can already execute quickly//reliably with and save myself some time.

###	Workers

Here's the fun part. I expect that almost all event data will exist in one of three formats:

* 	.ics

*	FB events / page

*	Unstructured data on gallery website / blog

I'll write workers to gather data from all three. I'll start with .ics because even though it's probably the least common among galleries, the high degree of structure means a single parser will work unaltered for any gallery that uses the format. Facebook events will be a bit harder to generalize, so I'll do that next. Since I'll have to make a custom parser for each gallery, I'll deal with unstructured data last.

### App // Calendar Output

Once the database is populated, I'll make a simple app to display the data in the browser. I doubt I'll get to it for this class, but at some point I might make a mobile app too. In the meantime I'll settle for a minimal responsive html jawn.

### Admin app for gallerists/curators/artists

I'd like to plan around the idea that this database could eventually be scaled outside chicago // nationally. Problem is, writing per-gallery parsers isn't really scalable without pretty major funding. If/when the database becomes popular, I might make another app that gallerists/curators/artists/etc can use to add their own crap to the database. 

I want to hold off until this is neccessary because first, opening up db-write access like that creates a plethora of potential headaches (fact checking, security, moderation), and second, because I don't really anticipate anyone going through effort to add data to an unused database…

