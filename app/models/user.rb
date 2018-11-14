class User < ApplicationRecord
  has_many :teams, dependent: :destroy

  has_secure_password
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :password, presence: true
end
