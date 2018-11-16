class Team < ApplicationRecord
  belongs_to :user
  has_many :heros_teams, dependent: :destroy
  has_many :heros, through: :heros_teams

  validates :roster_name, uniqueness: true
  validates :roster_name, presence: true

  def heroes
    self.heros
  end

  def full?
    if self.heros.size == 5
      return true
    else
      return false
    end
  end

end
