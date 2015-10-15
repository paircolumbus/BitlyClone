# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Url.create([
  {original: "http://www.google.com", shortened: "/g"},
  {original: "http://www.yahoo.com", shortened: "/b"},
  {original: "http://www.msn.com", shortened: "/c"},
  {original: "http://www.covermymeds.com", shortened: "/cmm"}
])
