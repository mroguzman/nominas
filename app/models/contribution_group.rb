class ContributionGroup < ActiveRecord::Base
  attr_accessible :number, :professional_category, :min_base_salary, :max_base_salary

  has_many :employees

  validates :number, presence: true, uniqueness: true
  validates :professional_category, presence: true, uniqueness: { case_sensitive: false }
  validates :min_base_salary, presence: true
  validates :max_base_salary, presence: true

  default_scope order(:number)

  def name
    "#{number}. #{professional_category}"
  end
end
