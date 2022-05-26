class Round < ApplicationRecord
  has_many :users, through: :user_rounds
  has_many :user_rounds
 
end
