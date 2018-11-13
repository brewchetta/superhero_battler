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

  end

end
