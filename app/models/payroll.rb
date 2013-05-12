# encoding: UTF-8

class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus,
    :social_sec_contribution, :start_date, :end_date, :company, :employee, :employee_id

  belongs_to :employee

  has_one :company, through: :employee

  validates :company, presence: true
  validates :employee, presence: true
  validates :salary, presence: true,
    numericality: { greater_than_or_equal_to: :min_salary, less_than_or_equal_to: :max_salary }
  validates :irpf, :social_sec_contribution, presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates_date :start_date, presence: true, before: :end_date
  validates_date :end_date, presence: true, after: :start_date
  validate :number_of_days_less_than_or_equal_maximum

  validates :bonus, :overtime, :salary_bonus, :payment_in_kind, :no_bonuses,
    numericality: { greater_than_or_equal_to: 0 }

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end

  def number_of_days_less_than_or_equal_maximum
    unless number_of_days.between?(min_number_of_days, max_number_of_days)
      errors.add(:end_date,
        "debe definir un periodo de entre #{min_number_of_days} y #{max_number_of_days} días")
    end
  end

  def number_of_days
    (end_date - start_date).to_i
  end

  def min_number_of_days
    1
  end

  def max_number_of_days
    31
  end
end