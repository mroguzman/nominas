class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :end_date, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus, 
  	:social_sec_contribution, :start_date, :company, :employee

  belongs_to :employee

  validates :end_date, presence: true
  validates :irpf, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 } 
  validates :salary, presence: true
  validates :social_sec_contribution, presence: true
  validates :start_date, presence: true
  validates :company, presence: true
  validates :employee, presence: true

end
