# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#

  User.create(:username => "admin", :usertype => 99, :password => "jesussaves", :password_confirmation => "jesussaves")

if ENV['RACK_ENV'] = "development"
  # Users, 1 for each TYPES
  User.create(:username => "coord", :usertype => 75, :password => "jesussaves", :password_confirmation => "jesussaves")
  
  User.create(:username => "pastor", :usertype => 60, :password => "jesussaves", :password_confirmation => "jesussaves")
  
  User.create(:username => "checkin", :usertype => 40, :password => "jesussaves", :password_confirmation => "jesussaves")
  
  User.create(:username => "volunteer", :usertype => 25, :password => "jesussaves", :password_confirmation => "jesussaves")
  
  User.create(:username => "all", :usertype => 0, :password => "jesussaves", :password_confirmation => "jesussaves")

  # Klasses
  Klass.create({name: "Nursery", min_group_id: 0, max_group_id: 1})
  Klass.create({name: "Monkeys", min_group_id: 2, max_group_id: 4})
  Klass.create({name: "Elephants", min_group_id: 5, max_group_id: 7})
  Klass.create({name: "Tribe", min_group_id: 8, max_group_id: 11})
  
  # Families
  Family.create({familyname: "Sample1", address: "1 Main St", city: "Gretna", state: "NE", zipcode: "68108", phone: "402-111-1111", alt_phone: "", alt_email: "", email: "sample1@example.com"})
  Family.create({familyname: "Sample2", address: "2 Main St", city: "Omaha", state: "NE", zipcode: "68127", phone: "402-222-2222", alt_phone: "", alt_email: "", email: "sample2@example.com"})
  Family.create({familyname: "Sampl3", address: "3 Main St", city: "Gretna", state: "NE", zipcode: "68108", phone: "402-333-3333", alt_phone: "", alt_email: "", email: "sample3@example.com"})
  Family.create({familyname: "Sample4", address: "4 Main St", city: "Millard", state: "NE", zipcode: "68135", phone: "402-444-4444", alt_phone: "", alt_email: "", email: "sample4@example.com"})
  Family.create({familyname: "Sample5", address: "5 Main St", city: "Gretna", state: "NE", zipcode: "68108", phone: "402-555-5555", alt_phone: "", alt_email: "", email: "sample5@example.com"})
  
  # Parents
  Parent.create({family_id: 1, firstname: "John", lastname: "Sample1", relationship: "1"})
  Parent.create({family_id: 1, firstname: "Suzy", lastname: "Sample1", relationship: "2"})
  Parent.create({family_id: 2, firstname: "Tom", lastname: "Sample2", relationship: "1"})
  Parent.create({family_id: 3, firstname: "Jerry", lastname: "Sample3", relationship: "1"})
  Parent.create({family_id: 3, firstname: "Marcy", lastname: "Sample3", relationship: "2"})
  Parent.create({family_id: 4, firstname: "Bob", lastname: "Sample4", relationship: "5"})
  Parent.create({family_id: 4, firstname: "Linda", lastname: "Sample4", relationship: "4"})
  Parent.create({family_id: 5, firstname: "Netty", lastname: "Sample5", relationship: "3"})
  
  # Children
  Child.create({family_id: 1, group_id: 1, firstname: "Lucy", lastname: "Sample1", birthday: "2014-01-01"})
  Child.create({family_id: 1, group_id: 3, firstname: "Billy", lastname: "Sample1", birthday: "2014-01-01"})
  Child.create({family_id: 2, group_id: 6, firstname: "John", lastname: "Sample2", birthday: "2014-01-01"})
  Child.create({family_id: 2, group_id: 4, firstname: "Matt", lastname: "Sample2", birthday: "2014-01-01"})
  Child.create({family_id: 2, group_id: 3, firstname: "Suzy", lastname: "Sample2", birthday: "2014-01-01"})
  Child.create({family_id: 2, group_id: 7, firstname: "Mark", lastname: "Sample2", birthday: "2014-01-01"})
  Child.create({family_id: 3, group_id: 5, firstname: "Frank", lastname: "Sample3", birthday: "2014-01-01"})
  Child.create({family_id: 3, group_id: 4, firstname: "Andy", lastname: "Sample3", birthday: "2014-01-01"})
  Child.create({family_id: 4, group_id: 1, firstname: "Nick", lastname: "Sample4", birthday: "2014-01-01"})
  Child.create({family_id: 4, group_id: 8, firstname: "Molly", lastname: "Sample4", birthday: "2014-01-01"})
  Child.create({family_id: 4, group_id: 3, firstname: "Keegan", lastname: "Sample4", birthday: "2014-01-01"})
  Child.create({family_id: 5, group_id: 6, firstname: "Kiper", lastname: "Sample5", birthday: "2014-01-01"})
  Child.create({family_id: 5, group_id: 2, firstname: "Sydney", lastname: "Sample5", birthday: "2014-01-01"})
  
  # Events
  Event.create({name: "Event1", date: "2014-04-01", start_time: nil, duration: 90})
  Event.create({name: "Event2", date: "2014-04-02", start_time: nil, duration: 60})
  Event.create({name: "Event3", date: "2014-04-03", start_time: nil, duration: 90})
  Event.create({name: "Event4", date: "2014-04-04", start_time: nil, duration: 120})
  Event.create({name: "Event5", date: "2014-04-05", start_time: nil, duration: 30})
  Event.create({name: "Event6", date: "2014-04-06", start_time: nil, duration: 10})
  Event.create({name: "Event7", date: "2014-05-07", start_time: nil, duration: 60})
  Event.create({name: "Event8", date: "2014-05-08", start_time: nil, duration: 90})
  Event.create({name: "Event9", date: "2014-05-09", start_time: nil, duration: 30})
  Event.create({name: "Event10", date: "2014-05-10", start_time: nil, duration: 120})
  
  # Attendances
  Attendance.create({event_id: 10, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 10, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 10, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 10, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 10, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 10, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 10, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 10, child_id: 13, klass_name: "Elephants"})
  Attendance.create({event_id: 1, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 1, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 1, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 1, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 1, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 1, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 1, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 1, child_id: 13, klass_name: "Elephants"})
  Attendance.create({event_id: 2, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 2, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 2, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 2, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 2, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 3, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 3, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 3, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 3, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 3, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 3, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 3, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 3, child_id: 13, klass_name: "Elephants"})
  Attendance.create({event_id: 4, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 4, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 4, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 4, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 4, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 4, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 4, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 5, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 5, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 5, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 5, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 5, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 5, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 5, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 5, child_id: 13, klass_name: "Elephants"})
  Attendance.create({event_id: 6, child_id: 1, klass_name: "Nursery"})
  Attendance.create({event_id: 6, child_id: 2, klass_name: "Monkeys"})
  Attendance.create({event_id: 6, child_id: 3, klass_name: "Elephants"})
  Attendance.create({event_id: 6, child_id: 4, klass_name: "Nursery"})
  Attendance.create({event_id: 6, child_id: 5, klass_name: "Monkeys"})
  Attendance.create({event_id: 6, child_id: 6, klass_name: "Tribe"})
  Attendance.create({event_id: 6, child_id: 12, klass_name: "Monkeys"})
  Attendance.create({event_id: 6, child_id: 13, klass_name: "Elephants"})
end