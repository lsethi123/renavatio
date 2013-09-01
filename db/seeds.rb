# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Account.create(organization: 'Hematology and Oncology')

Staff.create(firstname: 'Vincent', lastname: 'Du', email: 'vincentdu101@gmail.com', password: "stateofmind", title: "Transcriber", administrator: true, account_id: 1)
Staff.create(firstname: 'Katie', lastname: 'Kuo', email: 'katiekuo@gmail.com', password: "cookies", title: "Nurse", administrator: true, account_id: 1)