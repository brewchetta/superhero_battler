class HerosTeam < ApplicationRecord
  belongs_to :team

  belongs_to :hero
end
