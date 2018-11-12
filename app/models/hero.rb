class Hero < ApplicationRecord
  has_many :heros_teams
  has_many :teams, through: :heros_teams

  has_many :heros_powers
  has_many :powers, through: :heros_powers
end
