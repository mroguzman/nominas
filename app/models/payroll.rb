class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :end_date, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus,
    :social_sec_contribution, :start_date, :company, :employee, :employee_id

  belongs_to :employee

  has_one :company, through: :employee

  validates :end_date, presence: true
  validates :irpf, presence: true, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :salary, presence: true, numericality: { greater_than_or_equal_to: :min_salary, less_than_or_equal_to: :max_salary }
  validates :social_sec_contribution, presence: true
  validates :start_date, presence: true
  validates :company, presence: true
  validates :employee, presence: true

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end
end
