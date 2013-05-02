class Employee < ActiveRecord::Base
  attr_accessible :name, :nif, :sec_social_number, :company, 
    :contribution_group, :contribution_group_id

  has_many :payrolls
  belongs_to :company
  belongs_to :contribution_group
  
  validates :name, presence: true
  validates :nif, presence: true, uniqueness: { case_sensitive: false }
  validates :sec_social_number, presence: true, numericality: true, length: { is: 10 }
  validates :company, presence: true
  validates :contribution_group, presence: true
end