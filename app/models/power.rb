class Power < ApplicationRecord
  has_many :heros_powers
  has_many :heros, through: :heros_powers
end
