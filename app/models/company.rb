class Company < ActiveRecord::Base
  attr_accessible :cif, :name, :sec_social_number, :street

  belongs_to :user
  has_many :employees
  has_many :payrolls, through: :employees
  
  validates :cif, presence: true, uniqueness: { case_sensitive: false }, length: { is: 9 }
  validates :name, presence: true
  validates :sec_social_number, presence: true, numericality: true, length: { is: 10 }
end