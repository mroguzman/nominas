class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus,
    :social_sec_contribution, :start_date, :end_date, :company, :employee, :employee_id

  belongs_to :employee

  has_one :company, through: :employee

  validates :salary, presence: true, 
    numericality: { greater_than_or_equal_to: :min_salary, less_than_or_equal_to: :max_salary }
  validates :irpf, :social_sec_contribution, presence: true, 
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :company, presence: true
  validates :employee, presence: true
  validates_date :start_date, presence: true, before: :end_date
  validates_date :end_date, presence: true, after: :start_date

  validates :bonus, :overtime, :salary_bonus, :payment_in_kind, :no_bonuses, 
    numericality: { greater_than_or_equal_to: 0 }

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end
end