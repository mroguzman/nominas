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
  validate :dates_in_same_month

  validates :bonus, :overtime, :salary_bonus, :payment_in_kind, :no_bonuses,
    numericality: { greater_than_or_equal_to: 0 }, allow_blank: true

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end

  def dates_in_same_month
    if start_date.month != end_date.month
      errors.add(:end_date, "debe estar definida en el mismo mes que la fecha de inicio")
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



