class Battle < ApplicationRecord

  attr_reader :score_hash

  def teams
    array = []
    array << Team.find_by(id: self.team_id1)
    array << Team.find_by(id: self.team_id2)
    array
  end

  def team1
    @team1 = Team.find_by(id: self.team_id1)
  end

  def team2
    @team2 = Team.find_by(id: self.team_id2)
  end

  #currently only 1 player from team 1 is being fought
  def fight
    # score_hash = {:team1 => 0, :team2 => 0}
    team1 = self.team1
    team2 = self.team2
    team1_heroes = team1.heros
    team2_heroes = team2.heros
    team1_heroes.zip(team2_heroes).each do |duel|
      self.hero_fight(duel[0], duel[1])
      byebug
    end
    win_condition = score_hash[@team1] <=> score_hash[@team2]
    if win_condition == 1
      puts "#{@team1.roster_name} is the winner"
    else
      puts "#{@team2.roster_name} is the winner"
    end
  end

  

  def hero_fight(hero1, hero2)
    @score_hash = {@team1 => 0, @team2 => 0}
    score1 = hero1.powers.sample.score
    score2 = hero2.powers.sample.score
    boo = score1 <=> score2
      case boo
      #the puts method above is only for testing
      when 1
        puts "#{hero1.name} beat #{hero2.name}"
        @score_hash[@team1] += 1
      when -1
        puts "#{hero2.name} beat #{hero1.name}"
        @score_hash[@team2] += 1
     else
        puts "#{hero1.name} tied with #{hero2.name}"
    end
    @score_hash
  end

end


#collects loser of fight and winner of fight
#tallies each side's victories
#displays a winning team
#displays a message indicating both sides have kissed and made up.
