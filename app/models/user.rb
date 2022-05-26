class User < ApplicationRecord
  has_many :rounds, through: :user_rounds
  has_many :user_rounds 
  
end
