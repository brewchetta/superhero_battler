class Battle < ApplicationRecord

  attr_accessor :team1, :team2
  attr_reader :score_hash

  def teams
    teams = []
    teams << Team.find_by(id: self.team_id1)
    teams << Team.find_by(id: self.team_id2)
    array
  end

  def score_hash=(hash)

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
    @score_hash = {@team1 => {:winner => [], :loser => []}, @team2 => {:winner => [], :loser => []}}
    team1_heroes = @team1.heros.shuffle
    team2_heroes = @team2.heros.shuffle
    team1_heroes.zip(team2_heroes).each do |duel|
      self.hero_fight(duel[0], duel[1])
      if @winner1
        @score_hash[@team1][:winner] << duel[0]
      elsif @winner2
        @score_hash[@team2][:winner] << duel[1]
      else
        @score_hash[@team1][:loser] << duel[0]
        @score_hash[@team2][:loser] << duel[1]
      end
    end
    win_condition = score_hash[@team1][:winner].size <=> score_hash[@team2][:winner].size
    if win_condition == 1
      puts "#{@team1.roster_name} is the winner and #{@team2.roster_name} said 'Good Game'"
    elsif win_condition == -1
      puts "#{@team2.roster_name} is the winner and #{@team1.roster_name} said 'Good Game'"
    else
      puts "The battle was a tie."
    end
    @score_hash
    byebug
  end

  def hero_fight(hero1, hero2)
    byebug
    pow1 = hero1.powers.sample
    pow2 = hero2.powers.sample
    score1 = pow1.score
    score2 = pow2.score
    boo = score1 <=> score2
      case boo
      #the puts method above is only for testing
      when 1
        puts "#{hero1.name} beat #{hero2.name}"
        @winner1 = {hero1 => pow1.name}
      when -1
        puts "#{hero2.name} beat #{hero1.name}"
        @winner2 = {hero2 => pow2.name}
      else
        puts "#{hero1.name} tied with #{hero2.name}"
        return nil
      end
    @winner1 || @winner2
  end

end

#hero_fight needs to return a winner and a lp
