# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Url.create([{target_link: 'https://google.com'},
            {target_link: 'http://guides.rubyonrails.org/v4.1.12/action_controller_overview.html'}])
