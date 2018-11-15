class Battle < ApplicationRecord
  validate :full_team, on: :create

  attr_accessor :team1, :team2, :winner2, :winner1, :scores_hash, :winner

  def full_team
    team1 = self.team1
    team2 = self.team2
    if team1.full?
      errors.add(:team_id1, "must have full team")
    elsif team2.full?
      errors.add(:team_id2, "must have full team")
    end

  end

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

  # def winner
  #   @battle_array = self.fight
  #   @scores = {self.team1 => 0, self.team2 => 0}
  #   @battle_array.each do |scoring|
  #     scoring.each do |winloss|
  #       if winloss[:tie2]
  #         @scores[self.team1] += 1
  #         @scores[self.team2] += 1
  #       elsif winloss[:winnert1]
  #         @scores[self.team1] += 1
  #       elsif winloss[:winnert2]
  #         @scores[self.team2] += 1
  #       end
  #     end
  #   end
  #   @scores
  #   temp_winner = @scores[self.team1] <=> @scores[self.team2]
  #     case temp_winner
  #     when 1
  #       puts "#{self.team1.roster_name} is the winner"
  #       @winner = self.team1.roster_name
  #       @loser = self.team2.roster_name
  #       @result = [@winner, @loser]
  #     when -1
  #       puts "#{self.team2.roster_name} is the winner"
  #       @winner = self.team2.roster_name
  #       @loser = self.team1.roster_name
  #       @result = [@winner, @loser]
  #     when 0
  #       puts "#{self.team1.roster_name} tied with #{self.team1.roster_name}"
  #       @tie1 = self.team1.roster_name
  #       @tie2 = self.team2.roster_name
  #       @result = {:tiet1 => self.team1.roster_name, :tiet2 => self.team2.roster_name}
  #     end
  #   @result
  # end

  def winner
    @battle_array = self.fight[0]
    @scores_hash = self.fight[1]
    temp_winner = @scores_hash[:team1] <=> @scores_hash[:team2]
      case temp_winner
      when 1
        puts "#{self.team1.roster_name} is the winner"
        @winner = "#{self.team1.roster_name} is the winner and #{self.team2.roster_name} lost!"
      when -1
        puts "#{self.team2.roster_name} is the winner"
        @winner = "#{self.team2.roster_name} is the winner and #{self.team1.roster_name} lost!"
      when 0
        puts "#{self.team1.roster_name} tied with #{self.team1.roster_name}"
        @winner = "#{self.team1.roster_name} tied with #{self.team1.roster_name}"
      end
    @result = [@winner, @battle_array]
  end

  def fight
    @winner1 = 0
    @winner2 = 0
    @team1 = self.team1
    @team2 = self.team2
    @battle_array = []
    team1_heroes = @team1.heros.shuffle
    team2_heroes = @team2.heros.shuffle
    team1_heroes.zip(team2_heroes).each do |duel|
      one_fight = self.hero_fight(duel[0], duel[1])
      @battle_array << one_fight[0]
    end
    @scores_hash[:team1] = @winner1
    @scores_hash[:team2] = @winner2
    @team_battle = [@battle_array, @scores_hash]
  end

  def hero_fight(hero1, hero2)
    @scores_hash = {:team1 => 0, :team2 => 0}
    @tie = nil
    pow1 = hero1.powers.sample
    pow2 = hero2.powers.sample
    score1 = pow1.score
    score2 = pow2.score
    boo = score1 <=> score2
      case boo
      #the puts method above is only for testing
      when 1
        @winner1 += 1
        hero_fight = "#{hero1.name} beat #{hero2.name} with the power of #{pow1.name}"
        puts "#{hero1.name} beat #{hero2.name}"

      when -1
        @winner2 += 1
        hero_fight = "#{hero1.name} WAS beat by #{hero2.name} with the power of #{pow2.name}"
        puts "#{hero1.name} WAS beat #{hero2.name}"

      else
        puts "#{hero1.name} tied with #{hero2.name}"
        hero_fight = "#{hero1.name} tied with #{hero2.name}"
      end
      result = [hero_fight, @winner1, @winner2]
  end

  # def fight_helper
  #   string_array = ["", "", "", "", ""]
  #   @battle_array = self.fight
  #   @result = self.winner
  #   @string_thing = @battle_array.zip(string_array)
  #   @string_thing.each do |duel|
  #     # duel.each do |result|
  #
  #       if duel[0][:winnert1]
  #         duel[1] = "#{duel[0][:winnert1][0]} beat #{duel[1][:losert2][0]} with the power of #{duel[0][:winnert1][1]}"
  #       elsif duel[0][:winnert2]
  #         "#{duel[0][:winnert2][0]} beat #{duel[1][:losert1][0]} with the power of #{duel[0][:winnert2][1]}"
  #       elsif duel[0][:tiet1]
  #         "#{duel[0][:tiet1][0]} tied with #{duel[0][:tiet2][0]}"
  #       end
  #     # end
  #   end
  #   @string_thing
  #
  # end

end
