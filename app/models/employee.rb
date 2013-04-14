class Employee < ActiveRecord::Base
  attr_accessible :name, :nif, :sec_social_number, :company, 
  	:contribution_group

  belongs_to :company
  belongs_to :contribution_group
  
  validates :name, presence: true
  validates :nif, presence: true, uniqueness: { case_sensitive: false }
  validates :sec_social_number, numericality: true, length: { is: 10 }
  validates :company, presence: true
end
