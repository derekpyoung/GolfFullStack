class Round < ApplicationRecord
  has_many :users, through: :user_rounds
  has_many :user_rounds
  validates :bet_per_hole, presence: true
  validates :bet_per_kp, presence: true
  validates :bet_per_ld, presence: true
  validates :course, presence: true
 
 
end
