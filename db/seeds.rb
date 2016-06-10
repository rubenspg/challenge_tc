# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create(name: 'Test1', admin: true, password: '12345', email: 'test1@gmail.com')
User.create(name: 'Test2', admin: false, password: '12345', email: 'test2@gmail.com')
User.create(name: 'Test3', admin: false, password: '12345', email: 'test2@gmail.com')

Event.create(name: 'Event1', date: '05/05/2016', user_id: 1)
Event.create(name: 'Event2', date: '06/05/2016', user_id: 2)
Event.create(name: 'Event3', date: '07/05/2016', user_id: 3)

Guest.create(name: 'Guest1', event_id: 1)
Guest.create(name: 'Guest2', event_id: 1)
Guest.create(name: 'Guest1', event_id: 2)
Guest.create(name: 'Guest1', event_id: 3)
