class Hero < ApplicationRecord
  paginates_per 9
  has_many :heros_teams
  has_many :teams, through: :heros_teams

  has_many :heros_powers
  has_many :powers, through: :heros_powers

  validates :name, uniqueness: true

  extend ApiCommunicator
end
