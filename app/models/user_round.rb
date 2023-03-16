class UserRound < ApplicationRecord
  belongs_to :round
  belongs_to :user
  validates :kp_won, presence: true
  validates :ld_won, presence: true
  validates :holes_won, presence: true
  validates :score, presence: true
  validates :splits, presence: true 







end 
