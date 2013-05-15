# encoding: UTF-8

class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus,
    :social_sec_contribution, :start_date, :end_date, :agreement, :payment, :overtime_fm, :company, :employee, 
    :employee_id

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
  validate :dates_in_same_month_and_year
  validates :agreement, presence: true
 

  validates :bonus, :overtime, :salary_bonus, :payment_in_kind, :no_bonuses, :payment, :overtime_fm,
    numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  scope :by_year, ->(year) { where("EXTRACT(YEAR FROM start_date) = ?", year.to_s) }

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end

  def dates_in_same_month_and_year
    unless (start_date.month == end_date.month) && (start_date.year == end_date.year)
      errors.add(:end_date, "debe estar definida en el mismo mes y año que la fecha de inicio")
    end
  end

  # Campos calculados

  def total_devengado
    [salary, bonus, overtime, salary_bonus, payment_in_kind, no_bonuses].sum
  end

  def salario_liquido
    # TODO
  end

  def remuneracion_mensual
    salary + bonus
  end
end
