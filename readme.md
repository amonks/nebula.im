#	New Media project proposal

[Andrew Monks](http://monks.co) // 10/18/13

---

##	Intro (the problem)

From museums to apartment galleries, Chicago is **crammed** full of venues for art.

The problem is, it can be hard to know what's going on. The larger commercial galleries have the resources to publicize their events // openings, but many smaller apartment galleries only list their events on a facebook page or gallery website. With informal galleries popping up, it's nearly impossible to keep track of it all.

---

## 	Events database! (the solution)

I want to make a public directory of art events in Chicago. There needs to be a single unified listing of small art events. This will benefit everyone: it'll be easier for patrons to discover shows / work, it'll be easier for artists to artists to keep track of a large and integrated community, and it'll be easier for galleries to get people in the door.

---

## 	goals

I plan to accomplish this by creating and populating a database of events//galleries with a robust RESTful API. Think Songkick but for art.

Once the database and API exist, I (or anyone else) will be able to develop apps to distribute // harness the data.

---

## 	structure

<img src="http://cl.ly/S0zA/IMG_2878.JPG" alt="Schematic Jawn" style="width: 80%;" />

---

## 	steps (detail)

I'll develop three main software components:

1. 	Framework: Database // API

2. 	Input: Scrapers // Workers

3. 	Output: Calendar app

I don't want to get *too* pedantic, so I'll briefly outline my plans for execution.

---

## 	db - PG (heroku)

My first step is to set up the database//schema itself. While I'm tempted by a trendy nosql solution, I think the most economical move is to go with a free Postgres instance hosted by Heroku. Since (at least for now) I'll be the only person *writing* to the database, and my needs in terms of row count are pretty light, I don't anticipate reaching the limits of the free plan in the near future.

---

## 	API - Sinatra//Rack (heroku)

I'm going to write the API itself using Sinatra. I'd take the opportunity to get more familiar with node.js, but since the huge majority of the effort required by this project will be in the data acquisition I'd rather stick with a tool I can already execute quickly//reliably with and save myself some time.

---

##	Workers

Here's the fun part. I expect that almost all event data will exist in one of three formats:

* 	.ics

*	FB events / page

*	Unstructured data on gallery website / blog

I'll write workers to gather data from all three. I'll start with .ics because even though it's probably the least common among galleries, the high degree of structure means a single parser will work unaltered for any gallery that uses the format. Facebook events will be a bit harder to generalize, so I'll do that next. Since I'll have to make a custom parser for each gallery, I'll deal with unstructured data last.

---

## 	App // Calendar Output

Once the database is populated, I'll make a simple app to display the data in the browser. I doubt I'll get to it for this class, but at some point I might make a mobile app too. In the meantime I'll settle for a minimal responsive html jawn.


---

## 	Admin app for gallerists/curators/artists

I'd like to plan around the idea that this database could eventually be scaled outside chicago // nationally. Problem is, writing per-gallery parsers isn't really scalable without pretty major funding. If/when the database becomes popular, I might make another app that gallerists/curators/artists/etc can use to add their own crap to the database. 

I want to hold off until this is neccessary because first, opening up db-write access like that creates a plethora of potential headaches (fact checking, security, moderation), and second, because I don't really anticipate anyone going through effort to add data to an unused database…

---

## 	Resources // docs

This is kinda a separate project, but I feel I should mention it. I'd also like to create resources//documentation to help budding apartment gallerists set themselves up. I want to cull from my own personal experience having shows at my house, and put up some open docs about common pitfalls / advice / helpful shit. I feel like the calendar website might be a good place to put this.

---

## 	Doc approach

I want to put together a December show at Greeenha.u$. I want to document the whole process of putting it together, opening up everything from the submission process to show logistics to art decisions, to hanging techniques. 

---

## 	Theme

I'm not 100% concrete on this yet, but my initial thought is that the show should focus on networks. I'd like to primarily inlclude art pieces that involve some kind of connectivity / networks in some way.
