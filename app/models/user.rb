class User < ApplicationRecord
  before_save :downcase_name
  before_save :downcase_email
  has_many :rounds, through: :user_rounds
  has_many :user_rounds 
  validates :name, presence: true 
  validates :email, presence: true
  has_secure_password 
  validates :email, presence: true, uniqueness: true
  validates :email, uniqueness: { case_sensitive: false }

  def downcase_name
    self.name = name.downcase
  end
  def downcase_email 
    self.email = email.downcase 
  end 
  
end
