class ContributionGroup < ActiveRecord::Base
  attr_accessible :number, :professional_category, :min_base_salary, :max_base_salary
  
  validates :number, presence: true, uniqueness: true
  validates :professional_category, presence: true, uniqueness: { case_sensitive: false }
  validates :min_base_salary, presence: true
  validates :max_base_salary, presence: true
end
