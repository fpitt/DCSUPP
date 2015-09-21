# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(name: "admin")
user.administrator = true
user.save

#List of Students
user1 = User.create(name: "Christina Chung")
user2 = User.create(name: "Alan Yuan")
user3 = User.create(name: "Jackie Yan")
user4 = User.create(name: "Harun Mustafa")
user5 = User.create(name: "Fred Zhou")
user6 = User.create(name: "Michael Wu")
user7 = User.create(name: "Han Qiu")
user8 = User.create(name: "Dave Yungoo Kim")
user9 = User.create(name: "Tina Park")
user10 = User.create(name: "Tim Walker")
user11 = User.create(name: "Anh Phuong Tran")
user12 = User.create(name: "Jialin Song")
user13 = User.create(name: "Francesco Gramano")
user14 = User.create(name: "Jerry Chen")
user15 = User.create(name: "Daniela Chang")
user16 = User.create(name: "Krista Martono")
user17 = User.create(name: "Max Yang")
user18 = User.create(name: "Teresa Liang")
user19 = User.create(name: "Katie Lo")
user20 = User.create(name: "Zoe Song")

