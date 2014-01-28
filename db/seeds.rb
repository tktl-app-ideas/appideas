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
