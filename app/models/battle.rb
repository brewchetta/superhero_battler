class Battle < ApplicationRecord

  attr_accessor :team1, :team2
  attr_reader :score_hash

  def teams
    teams = []
    teams << Team.find_by(id: self.team_id1)
    teams << Team.find_by(id: self.team_id2)
    array
  end

  def team1
    @team1 = Team.find_by(id: self.team_id1)
  end

  def team2
    @team2 = Team.find_by(id: self.team_id2)
  end

  #TODO swap out puts methods so that actual return strings are produced.

  def winner
    @score_hash = self.fight
    byebug
    @scores = {self.team1 => 0, self.team2 => 0}
    @score_hash.each do |scoring|
      scoring.each do |winloss|
        if winloss[:tie2]
          @scores[self.team1] += 1
          @scores[self.team2] += 1
        elsif winloss[:winnert1]
          @scores[self.team1] += 1
        elsif winloss[:winnert2]
          @scores[self.team2] += 1
        end
      end
    end
    @scores
    temp_winner = @scores[self.team1] <=> @scores[self.team2]
      case temp_winner
      when 1
        puts "#{self.team1.roster_name} is the winner"
        @winner = self.team1.roster_name
        @loser = self.team2.roster_name
        @result = [@winner, @loser]
      when -1
        puts "#{self.team2.roster_name} is the winner"
        @winner = self.team2.roster_name
        @loser = self.team1.roster_name
        @result = [@winner, @loser]
      when 0
        puts "#{self.team1.roster_name} tied with #{self.team1.roster_name}"
        @tie1 = self.team1.roster_name
        @tie2 = self.team2.roster_name
        @result = {:tiet1 => self.team1.roster_name, :tiet2 => self.team2.roster_name}
      end
    @result
    byebug
  end

  def fight
    @team1 = self.team1
    @team2 = self.team2
    @score_hash = []
    team1_heroes = @team1.heros.shuffle
    team2_heroes = @team2.heros.shuffle
    team1_heroes.zip(team2_heroes).each do |duel|
      self.hero_fight(duel[0], duel[1])
      if @winner1
        @score_hash << @winner1
      elsif @winner2
        @score_hash << @winner2
      elsif @tie
        @score_hash << @tie
      end
    end
    @score_hash
  end

  def hero_fight(hero1, hero2)
    @scores = {@team1 => 0, @team2 => 0}
    @winner1 = nil
    @winner2 = nil
    @tie = nil
    pow1 = hero1.powers.sample
    pow2 = hero2.powers.sample
    score1 = pow1.score
    score2 = pow2.score
    boo = score1 <=> score2
      case boo
      #the puts method above is only for testing
      when 1
        puts "#{hero1.name} beat #{hero2.name}"
        @winner1 = [{:winnert1 => [hero1.name, pow1.name]}, {:losert2 => [hero2.name, pow2.name]}]
      when -1
        puts "#{hero1.name} WAS beat #{hero2.name}"
        @winner2 = [{:winnert2 => [hero2.name, pow2.name]}, {:losert1 => [hero1.name, pow1.name]}]
      else
        puts "#{hero1.name} tied with #{hero2.name}"
        @tie = [{:tiet2 => [hero2.name, pow2.name]}, {:tiet1 => [hero1.name, pow1.name]}]
      end
    @winner1 || @winner2 || @tie
  end

end
