class User < ApplicationRecord
  has_many :rounds, through: :user_rounds
  has_many :user_rounds 
  validates :name, presence: true 
  validates :email, presence: true
  
end
