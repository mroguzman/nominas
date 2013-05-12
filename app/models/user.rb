class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation

  has_one :company
  has_many :payrolls, through: :company

  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX }, uniqueness: true
  validates :password, length: { minimum: 6 }

  has_secure_password

  def name
    [company.try(:name), email].join(" | ")
  end
end
