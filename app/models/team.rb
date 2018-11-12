class Team < ApplicationRecord
  belongs_to :user
  has_many :heros_teams
  has_many :heros, through: :heros_teams
end
