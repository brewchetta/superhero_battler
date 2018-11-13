class Team < ApplicationRecord
  belongs_to :user
  has_many :heros_teams
  has_many :heros, through: :heros_teams

  validates :roster_name, uniqueness: true

  def heroes
    self.heros
  end


end
