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

  def fight
    team1 = self.team1
    team2 = self.team2
    team1_heroes = team1.heros
    team2_heroes = team2.heros
    team1_heroes.each do |hero1|
      team2_heroes.each {|hero2| self.hero_fight(hero1, hero2)}
    end

  end

  #unsure of outcome if power.score for both heroes is equal
  def hero_fight(hero1, hero2)
    score1 = hero1.powers.sample.score
    score2 = hero2.powers.sample.score
    boo = score1 <=> score2
      case boo
      when true then "#{hero1.name} beat #{hero2.name}"
      when false then "#{hero2.name} beat #{hero1.name}"
      end
  end

  #hero1 power sample score vs hero2power score

end
