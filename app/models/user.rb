class User < ApplicationRecord
  before_save :downcase_name
  before_save :downcase_email

  has_many :user_rounds, dependent: :destroy
  has_many :rounds, through: :user_rounds

  validates :name, presence: true
  validates :email, presence: true, uniqueness: { case_sensitive: false }

  has_secure_password

  private

  def downcase_name
    self.name = name.downcase
  end

  def downcase_email
    self.email = email.downcase
  end
end
