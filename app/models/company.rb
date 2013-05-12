class Company < ActiveRecord::Base
  attr_accessible :cif, :name, :sec_social_number, :street

  belongs_to :user
  has_many :employees
  has_many :payrolls, through: :employees
  
  VALID_CIF_REGEX = /\A[a-zA-Z]{1}[0-9]{8}\z/
  
  validates :user, presence: true
  validates :cif, presence: true, uniqueness: { case_sensitive: false }, format: { with: VALID_CIF_REGEX }
  validates :name, presence: true
  validates :sec_social_number, presence: true, numericality: true, length: { is: 12 } 
end