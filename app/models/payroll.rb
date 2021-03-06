# encoding: UTF-8

class Payroll < ActiveRecord::Base
  AGREEMENT_INDEFINIDO = :indefinido
  AGREEMENT_TEMPORAL = :temporal
  AGREEMENT_TYPES = [AGREEMENT_INDEFINIDO, AGREEMENT_TEMPORAL]

  attr_accessible :bonus, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary,
    :salary_bonus, :start_date, :end_date, :agreement, :payment, :overtime_fm, :indemnification,
    :indemnification_sec_social, :indemnification_for_transfer, :company, :employee, :employee_id

  belongs_to :employee

  has_one :company, through: :employee

  validates :company, presence: true
  validates :employee, presence: true
  validates :salary, presence: true,
    numericality: { greater_than_or_equal_to: :min_salary, less_than_or_equal_to: :max_salary }
  validates :irpf, presence: true,
    numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }
  validates :agreement, presence: true, inclusion: { in: AGREEMENT_TYPES.map(&:to_s) }
  validates :bonus, :overtime, :salary_bonus, :payment_in_kind, :no_bonuses, :payment, :overtime_fm,
    numericality: { greater_than_or_equal_to: 0 }, allow_blank: true
  validates_date :start_date, presence: true, before: :end_date
  validates_date :end_date, presence: true, after: :start_date

  validate :dates_in_same_month_and_year
  validate :dates_not_overlap_with_other_payrolls

  default_value_for :bonus, value: 0.0, allows_nil: false
  default_value_for :no_bonuses, value: 0.0, allows_nil: false
  default_value_for :overtime, value: 0.0, allows_nil: false
  default_value_for :payment_in_kind, value: 0.0, allows_nil: false
  default_value_for :payment, value: 0, allows_nil: false
  default_value_for :salary_bonus, value: 0.0, allows_nil: false
  default_value_for :overtime_fm, value: 0.0, allows_nil: false
  default_value_for :indemnification, value: 0.0, allows_nil: false
  default_value_for :indemnification_sec_social, value: 0.0, allows_nil: false
  default_value_for :indemnification_for_transfer, value: 0.0, allows_nil: false

  scope :by_year, ->(year) { where("EXTRACT(YEAR FROM start_date) = ?", year.to_s) }

  def min_salary
    employee.contribution_group.min_base_salary
  end

  def max_salary
    employee.contribution_group.max_base_salary
  end

  def dates_in_same_month_and_year
    unless (start_date.month == end_date.month) && (start_date.year == end_date.year)
      errors[:base] << "La fecha de inicio y de fin deben estar definidas en el mismo mes y año"
    end
  end

  def dates_not_overlap_with_other_payrolls
    employee.payrolls.each do |payroll|
      if dates_overlap_with_other_payroll? payroll
        errors[:base] << "Has asignado un rango de fechas en las que existe otra nómina para este empleado"
      end
    end
  end

  def dates_overlap_with_other_payroll?(payroll)
    (start_date <= payroll.end_date) && (end_date >= payroll.start_date)
  end

  # Campos calculados

  def salario_bruto
    if start_date.month == 6 || start_date.month == 12
      [salary, bonus, no_bonuses, overtime, overtime_fm, salary_bonus].sum
    else
      [salary, bonus, no_bonuses, overtime, overtime_fm].sum
    end
  end

  def total_devengado
    if start_date.month == 6 || start_date.month == 12
      [salary, bonus, overtime, overtime_fm, payment_in_kind, no_bonuses, salary_bonus, indemnification, indemnification_sec_social, indemnification_for_transfer].sum
    else
      [salary, bonus, overtime, overtime_fm, payment_in_kind, no_bonuses, indemnification, indemnification_sec_social, indemnification_for_transfer].sum
    end
  end

  def iprem
    0.2 * 532.21
  end

  def prorrata_paga_extra
    (payment * salary_bonus) / 12.0
  end

  def bcc
    if no_bonuses > iprem
      [salary, bonus, (no_bonuses - iprem), prorrata_paga_extra].sum
    else
      [salary, bonus, prorrata_paga_extra].sum
    end
  end

  def bcp
    [bcc, overtime, overtime_fm].sum
  end

  def bhe
    [overtime, overtime_fm].sum
  end

  def c_comunes
    0.047 * bcc
  end

  def desempleo
    case agreement.to_sym
    when AGREEMENT_INDEFINIDO
      0.0155 * bcp
    when AGREEMENT_TEMPORAL
      0.016 * bcp
    end
  end

  def f_profesional
    0.001 * bcp
  end

  def horas_extras_normales
    0.047 * overtime
  end

  def horas_extras_fuerza_mayor
    0.02 * overtime_fm
  end

  def aportacion_sec_social
    [c_comunes, desempleo, f_profesional, horas_extras_normales, horas_extras_fuerza_mayor].sum
  end

  def aportacion_irpf
    (irpf / 100) * salario_bruto
  end

  def deducciones
    aportacion_sec_social + aportacion_irpf
  end

  def salario_liquido
    salario_bruto - deducciones
  end

  def remuneracion_mensual
    bcc - prorrata_paga_extra
  end
end
