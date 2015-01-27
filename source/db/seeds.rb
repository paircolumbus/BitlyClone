# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Url.delete_all

Url.create! destination: "https://www.google.com/"
Url.create! destination: "https://www.stackoverflow.com/"
Url.create! destination: "https://www.mint.com/"
