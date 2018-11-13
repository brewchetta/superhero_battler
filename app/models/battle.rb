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

end
