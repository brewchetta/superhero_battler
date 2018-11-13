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

puts "filling our universe with powers"
powers = {"Flight"=>2, "Super Strength"=>3, "Super Speed"=>3, "Agility"=>1, "Stamina"=>1, "Invulnerability"=>4, "Telepathy"=>3, "Telekinesis"=>3, "Intellect"=>1, "Teleport"=>2, "Radar Sense"=>1, "Psychic"=>2, "Force Field"=>3, "Blast Power"=>2, "Healing"=>3, "Magic"=>5, "Weapon Master"=>1, "Super Sight"=>1, "Super Smell"=>1, "Super Hearing"=>1, "Invisibility"=>2, "Phasing / Ghost"=>2, "Chameleon"=>1, "Shape Shifter"=>2, "Magnetism"=>3, "Fire Control"=>3, "Implants"=>1, "Feral"=>1, "Psionic"=>2, "Insanely Rich"=>1, "Power Suit"=>3, "Radiation"=>2, "Elasticity"=>3, "Unarmed Combat"=>1, "Gadgets"=>1, "Weather Control"=>4, "Divine Powers"=>5, "Siphon Abilities"=>4, "Size Manipulation"=>3, "Immortal"=>5, "Necromancy"=>3, "Vampirism"=>2, "Electricity Control"=>3, "Ice Control"=>3, "Sub-Mariner"=>1, "Wall Clinger"=>1, "Mesmerize"=>2, "Penance Stare"=>3, "Sonic Scream"=>2, "Escape Artist"=>1, "Tracking"=>1, "Astral Projection"=>1, "Danger Sense"=>1, "Possession"=>4, "Sand manipulation"=>2, "Adaptive"=>1, "Electronic interaction"=>2, "Animation"=>1, "Probability Manipulation"=>5, "Super Eating"=>1, "Precognition"=>2, "Energy-Enhanced Strike"=>2, "Technopathy"=>2, "Inertia Absorption"=>3, "Light Projection"=>1, "Holographic Projection"=>1, "Reality Manpulation"=>5, "Swordsmanship"=>1, "Electronic Disruption"=>1, "Levitation"=>1, "Soul Absorption"=>4, "Duplication"=>1, "Emotion Control"=>1, "Matter Absorption"=>2, "Dimensional Manipulation"=>4, "Animal Control"=>2, "Enhance Mutation"=>2, "Omni-lingual"=>1, "Postcognition"=>1, "Shadowmeld"=>1, "Energy Shield"=>3, "Time Travel"=>5, "Siphon Lifeforce"=>3, "Sense Death"=>1, "Darkforce Manipulation"=>2, "Vibration Wave"=>1, "Power Mimicry"=>3, "Empathy"=>1, "Gravity control"=>4, "Darkness Manipulation"=>2, "Illusion Casting"=>2, "Heat Vision"=>2, "Psychometry"=>1, "Wind Bursts"=>2, "Density Control"=>2, "Earth Manipulation"=>4, "Marksmanship"=>1, "Genetic Manipulation"=>3, "Time Manipulation"=>5, "Power Item"=>1, "Plant Control"=>2, "Claws"=>1, "Death Touch"=>4, "Hypnosis"=>2, "Poisonous"=>2, "Pheromone Control"=>1, "Water Control"=>3, "Chemical Secretion"=>1, "Energy Absorption"=>3, "Energy Manipulation"=>4, "Cosmic Awareness"=>2, "Willpower-Based Constructs"=>3, "Heat Generation"=>3, "Energy Based Constructs"=>3, "Synaesthesia"=>1, "Voice-induced Manipulation"=>2, "Chemical Absorbtion"=>1, "Stealth"=>1, "Berserker Strength"=>2, "Leadership"=>5, "Longevity"=>2, "Controlled Bone Growth"=>2, "Webslinger"=>5, "Ice Breath"=>3, "Flame Breath"=>3, "Hellfire Control"=>3, "Prehensile Hair"=>2, "Blood Control"=>2, "None"=>0}

powers.each do |name, score|
  Power.create(name: name, score: score)
end

# max score = 5

puts "powers exist now winky face emoji"

puts "Ready to save / destroy the world!"
