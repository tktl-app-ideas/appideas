# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Main: Project
k1 = Keyword.create name:"Project", concrete:true
k2 = Keyword.create name:"Desktop", concrete:true
k3 = Keyword.create name:"Mobile", concrete:true
k4 = Keyword.create name:"Native", concrete:true
k5 = Keyword.create name:"iOS", concrete:true
k6 = Keyword.create name:"Android", concrete:true
k7 = Keyword.create name:"Windows", concrete:true
k8 = Keyword.create name:"Blackberry", concrete:true
k9 = Keyword.create name:"Multiplatform", concrete:true
k10 = Keyword.create name:"Web", concrete:true
k11 = Keyword.create name:"HTML", concrete:true
k12 = Keyword.create name:"CSS", concrete:true
k13 = Keyword.create name:"JavaScript", concrete:true

# Main: Data source
k14 = Keyword.create name:"Data source", concrete:true
k15 = Keyword.create name:"Open data", concrete:true
k16 = Keyword.create name:"Scraping", concrete:true

# Main: Business
k17 = Keyword.create name:"Business", concrete:true
k18 = Keyword.create name:"Startup", concrete:true
k19 = Keyword.create name:"Corporation", concrete:true

# Main: Activity
k20 = Keyword.create name:"Activity", concrete:true
k21 = Keyword.create name:"Hackatron", concrete:true
k22 = Keyword.create name:"Competition", concrete:true
k23 = Keyword.create name:"Code Retreat", concrete:true
k24 = Keyword.create name:"GameJam", concrete:true

# test user
user = User.create username:"Test", password:"Test"

# Customer's ideas
i1 = Idea.create name:"Datademo jakaa 2000€ ideoille", desc:"Startup-henkisille opiskelijaserkuille hyvä mahdollisuus saada 2000eur käteen prototyypin kehittämiseksi. Hakuaika alkaa tammikuussa. 

http://fi.okfn.org/datademo/"

i2 = Idea.create name:"Node.js project (1-3cr)", desc:"This is for CS Helsinki students only:

Implement the node.js -project you've dreamed about. Register to the course through ilmo.cs.helsinki.fi before 26. Feb. The project course is held at mid-term break on 3.-10.3.2014.

Do you have any ideas what to do? I'm lacking imagination."

i3 = Idea.create name:"Stoppi (This is an idea, not an actual project that has been coded yet)", desc:"Stoppi is a 2019 way to stop the bus!

Seeing which bus is about to arrive at the bus-stop one is standing at is compromised by the arctic darkness and hash weateher conditions such as autumn rain or sleet storms that are very common in Finland.

With Stoppi -mobile app a user can see which busses are about to arrive and he can signal the bus to stop a long beforehand. Thanks to the app the bus driver will be informed that passangers are waiting to be picked up at a specific bus stop. This allows avoiding late signaling (hand-waving) at the bus stop and dangers of emergency braking due to the driver not recognizing the passanger that is waiting at the bus stop.

There is also another benefit of using the Stoppi app. The app recognizes that a passanger has entered a bus and therefore he can browse which stops are next on the drive. This facilitates getting off the buss in a new environment where the passanger doesn't quite know where to get off. E.g. the motorway, the bus stops are 
all alike.

Unfortunately it is not currently possible to implement the whole app because of the limitedness of soft- and hardware inside busses. But maybe a compromised version of the app would be possible to develop?

Authors: Simo Mäkinen, Hanna Mäenpää (email)

Detailed description: 
http://www.apps4finland.fi/kilpailutyo/stoppi/

Help and open data to help starting the project: 
http://dev.hsl.fi/ #hsl-dev@ircnet"

i4 = Idea.create name:"Call for apps! Join the Apps for Europe Online Competition!!!", desc:"Apps for Europe is running an online competition to find the best app developers across the continent. Are you making an open data based app or do you know open data start-ups that can use a boost? Please read and forward this call for apps.

More information: https://www.forumvirium.fi/node/2504

Deadline: 7th February"

i5 = Idea.create name:"Ericsson Application Awards 2015 now open", desc:"Theme for this year is Apps for Working Life.

Is your app a winner? Developers, startups and students who have an idea for a great app, here is your opportunity! You are invited to submit your entries and compete in the Ericsson Application Awards 2014 for the best Android or iOS apps.

How will working life be organized to meet changing behaviors and emerging technologies? How can we contribute toward making the next generation of working life a one where people can innovate, collaborate and balance their lives outside work better? We are open to your suggestions.

The awards for each category (students and companies) are as follows:

1st place: EUR 25 000 
2nd place: EUR 10 000 
3rd – 10th place: diplomas and honorary mentions 
There will also be a special recognition for innovation supporting Technology for Good.

Key dates

February 28, 2014: Final date for submitting application Submission 
March 14, 2014: The semi-finalists are announced (top five in each category) 
April 24, 2014: The finalists are announced (top two in each category) 
May 2014: Awards ceremony

More information: http://www.ericsson.com/thecompany/events/ericsson-application-awards"

i6 = Idea.create name:"European Congress: ITS in your pocket - App Contest 2014", desc:"Best traffic applications awarded in Helsinki 2014

The transport system including vehicles, infrastructures and the related industries is the biggest ecosystem humans have ever created. Smart traffic solutions and services are seen as one of the biggest future solutions area for ICT. New smarter traffic solutions are also key elements in creating more sustainable smart cities. This means an enormous number of business opportunities worldwide.

Application proposals should include fresh innovations and work on a range of nomadic devices. However, conceptual “out-of-the-box” ideas will be also accepted. To make life easier for developers, open public data is available.

The competition will close in April 2014 and a short list of the best applications will be published in May 2014. Winners will be informed in early June and invited to the opening ceremony of ITS Europe Helsinki 2014.

Visit www.itsinyourpocket.com for more information about the contest rules or contact info@itsinyourpocket.com."

i7 = Idea.create name:"Microsoft App Awards", desc:"Do you have the best app in the field? Innovative, fresh idea that you will launch to international markets via the Windows Store? Then do not hesitate to submit it for the Finnish App Awards 2014!

In Finland we have a long history of making great products, a high sense of quality, and a flair for design. We want to celebrate those who carry those traditions to app development.

App Awards is the first competition and celebration of outstanding achievement & excellence in Windows 8 and Windows Phone app development. The competition is sponsored by Microsoft, Nokia, AppCampus and Miltton.

The grand prize for winner is an amazing marketing, PR and advertising sponsor deal with Microsoft, Nokia, AppCampus and Miltton. The award is a great opportunity to get your app visible to a mass of consumers. The prize is something you can't buy with money.

Apps made for Windows 8 tablets or Windows Phone can be submitted to competition during 1st July 2013 to 30th March 2014. You can submit as many apps as you like to be nominated.

http://www.microsoft.com/finland/appawards/"

i8 = Idea.create name:"Bitcoin gambling site", desc:"I heard this one on the radio.

Establishing a (money) gambling site (e.g. poker) is illegal in Finland because of a monopoly of Raha-automaattiyhdistys (RAY) exists. And this is due the finnish law, no way around it.

However, since Bitcoin is not officially a currency, one could establish a bitoin-based gambling site would be possible. Ta-da."

i9 = Idea.create name:"Any small Leaflet.js -projects?", desc:"Hi, 
Has anybody done any small projects with e.g. mysql+css+ruby+leafy.js? I'm planning to, but it would be great to continue from where somebody left off."
