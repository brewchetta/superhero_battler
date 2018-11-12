# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puts "Wiping all life in preparation for a glorious new age ..."
Team.all.each {|item| item.destroy}
User.all.each {|item| item.destroy}
Hero.all.each {|item| item.destroy}
Power.all.each {|item| item.destroy}
Battle.all.each {|item| item.destroy}

puts "Creating new users ..."
u1 = User.create(name:"Alex")
u2 = User.create(name:"Chett")
u3 = User.create(name:"Wangtron")

puts "Registering new teams ..."
t1 = Team.new(roster_name: "Alex's Team")
t2 = Team.new(roster_name: "Chett's Team")
t3 = Team.new(roster_name: "Wangtron's Team")

u1.teams << t1
u2.teams << t2
u3.teams << t3

t1.save
t2.save
t3.save

puts "Finding some hero(e)s ..."
h1 = Hero.create(name:"Spiderman")
h2 = Hero.create(name: "Ultraman")
h3 = Hero.create(name: "Doctor Doom")
h4 = Hero.create(name: "Spawn")
h5 = Hero.create(name: "Batman")
h6 = Hero.create(name: "Batwoman")

puts "Adding hero(e)s to teams ..."
t1.heros << h1
t1.heros << h2
t2.heros << h3
t2.heros << h4
t3.heros << h5
t3.heros << h6

puts "Discovering a hero's true power ..."
p1 = Power.create(name: "Telekinesis", description: "Move things with your brain.")
p2 = Power.create(name: "Spider Senses", description: "Everything smells like a spider")
p3 = Power.create(name: "Flight", description: "Can book a flight")
p4 = Power.create(name: "Super Strength", description: "Like normal strength except a lil more")
p5 = Power.create(name: "Invulnerable", description: "The opposite of vulnerable")
p6 = Power.create(name: "Impossible to Distract", description: "So much focus...")

Hero.all.sample.powers << p1
Hero.all.sample.powers << p2
Hero.all.sample.powers << p3
Hero.all.sample.powers << p4
Hero.all.sample.powers << p5
Hero.all.sample.powers << p6

puts "Ready to save / destroy the world!"
