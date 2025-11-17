class UserRound < ApplicationRecord
  belongs_to :round
  belongs_to :user

  validates :holes_won, presence: true, numericality: { only_integer: true }
  validates :kp_won, presence: true, numericality: { only_integer: true }
  validates :ld_won, presence: true, numericality: { only_integer: true }
  validates :score, presence: true, numericality: { only_integer: true }
  validates :splits, numericality: { only_integer: true }, allow_nil: true
end 
