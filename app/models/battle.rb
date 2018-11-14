class Battle < ApplicationRecord

  def teams
    array = []
    array << Team.find_by(id: self.team_id1)
    array << Team.find_by(id: self.team_id2)
    array
  end

  def team1
    Team.find_by(id: self.team_id1)
  end

  def team2
    Team.find_by(id: self.team_id2)
  end

  #currently only 1 player from team 1 is being fought
  def fight
    team1 = self.team1
    team2 = self.team2
    team1_heroes = team1.heros
    team2_heroes = team2.heros
    team1_heroes.each do |hero1|
      team2_heroes.each {|hero2| self.hero_fight(hero1, hero2)}
    end
    #collects loser of fight and winner of fight
    #tallies each side's victories
    #displays a winning team
    #displays a message indicating both sides have kissed and made up.

  end

  #unsure of outcome if power.score for both heroes is equal
  #this is currently returning nil and putting nothing out to console
  def hero_fight(hero1, hero2)
    byebug
    score1 = hero1.powers.sample.score
    score2 = hero2.powers.sample.score
    boo = score1 <=> score2
    puts case boo
      #the puts method above is only for testing
    when 1 then "#{hero1.name} beat #{hero2.name}"
    when -1 then "#{hero2.name} beat #{hero1.name}"
    else puts "#{hero1.name} tied with #{hero2.name}"
    end
  end
  # if boo
  #   puts "h1"
  # elsif boo != true
  #   puts "h2"
  # else
  #   puts "tie"
  # end

  #hero1 power sample score vs hero2power score

end
