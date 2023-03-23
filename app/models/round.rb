class Round < ApplicationRecord
  has_many :users, through: :user_rounds
  has_many :user_rounds
  validates :bet_per_hole, numericality: { only_integer: true }, presence: true
  validates :bet_per_kp, numericality: { only_integer: true }, presence: true
  validates :bet_per_ld, numericality: { only_integer: true }, presence: true
  validates :course, presence: true

  

end
