class Team < ApplicationRecord
  belongs_to :user
  has_many :heros_teams
  has_many :heros, through: :heros_teams

  # validate :unique_hero
  validates :roster_name, uniqueness: true


  # def unique_hero
  #   byebug
  #   if self.heros.include?()
  #     byebug
  #     errors.add(:hero_id, ": Cannot have duplicate heroes on the same team")
  #   end
  # end

end
