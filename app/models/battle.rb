class Battle < ApplicationRecord

  attr_accessor :team1, :team2
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

  #TODO swap out puts methods so that actual return strings are produced.

  def fight
    @team1 = self.team1
    @team2 = self.team2
    team1_heroes = @team1.heros
    team2_heroes = @team2.heros
    @team1.heros.zip(@team2.heros).each do |duel|
      self.hero_fight(duel[0], duel[1])
    end
    win_condition = score_hash[@team1] <=> score_hash[@team2]
    if win_condition == 1
      puts "#{@team1.roster_name} is the winner and #{@team2.roster_name} said 'Good Game'"
    elsif win_condition == -1
      puts "#{@team2.roster_name} is the winner and #{@team1.roster_name} said 'Good Game'"
    else
      puts "The battle was a tie."
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
