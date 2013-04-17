class Company < ActiveRecord::Base
  attr_accessible :cif, :name, :sec_social_number, :street

  has_many :employees
  
  validates :cif, presence: true, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :name, presence: true
  validates :sec_social_number, presence: true, numericality: true, length: { is: 10 }
end