class User < ActiveRecord::Base
  attr_accessible :email, :password_digest
  
  has_one :company
  
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, format: { with: VALID_EMAIL_REGEX } 

  has_secure_password
end
