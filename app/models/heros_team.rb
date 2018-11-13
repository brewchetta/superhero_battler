class HerosTeam < ApplicationRecord
  belongs_to :team

  belongs_to :hero

  validate :unique_hero

  private

  # Makes sure heroes are unique to a team
  def unique_hero
    HerosTeam.each do |ht|
      if team_id == ht.team.id && hero_id == ht.hero.id

      end        
    end
  end

end
