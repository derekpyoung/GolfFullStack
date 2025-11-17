class Round < ApplicationRecord
  has_many :user_rounds, dependent: :destroy
  has_many :users, through: :user_rounds

  validates :bet_per_hole, presence: true, numericality: { only_integer: true }
  validates :bet_per_kp, presence: true, numericality: { only_integer: true }
  validates :bet_per_ld, presence: true, numericality: { only_integer: true }
  validates :course, presence: true
end
