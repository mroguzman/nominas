class Payroll < ActiveRecord::Base
  attr_accessible :bonus, :end_date, :irpf, :no_bonuses, :overtime, :payment_in_kind, :salary, :salary_bonus, :social_sec_contribution, :start_date

  belongs_to :employee
end
