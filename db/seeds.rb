# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

joker   = User.create!(nickname: 'Joker',
                       password: 'q1w2e3q1w2e3',
                       password_confirmation: 'q1w2e3q1w2e3')
snoop = User.create!(nickname: 'Snoop Dogg',
                     password: 'q1w2e3q1w2e3',
                     password_confirmation: 'q1w2e3q1w2e3')
loki  = User.create!(nickname: 'Loki',
                     password: 'q1w2e3q1w2e3',
                     password_confirmation: 'q1w2e3q1w2e3')
Worker.create!(title: 'Snoop Dogg Task',
               user: snoop)
Worker.create!(title: 'Joker Task',
               user: joker)

