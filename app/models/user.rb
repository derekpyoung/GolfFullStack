class User < ApplicationRecord
  before_save :downcase_name 
  has_many :rounds, through: :user_rounds
  has_many :user_rounds 
  validates :name, presence: true 
  validates :email, presence: true
  has_secure_password 
  validates :email, presence: true, uniqueness: true

  def downcase_name
    self.name = name.downcase
  end 
  
end
