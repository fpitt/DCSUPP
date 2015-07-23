# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Project_list = []

(1..20).each do |i|
	title = i.to_s + "project"
	text = "text"
	Project_list.push([title, text])
end

Project_list.each do |title, text|
	Project.create(title: title, text: text)
end

user = User.create(name: "admin")
user.professor = true
user.administrator = true
user.save