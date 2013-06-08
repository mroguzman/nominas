# encoding: utf-8

module PayrollsHelper
  def years_for_payrolls(payrolls)
    payrolls.map(&:start_date).map(&:year).uniq.sort.reverse
  end

  def number_to_euros(number)
    "#{number_with_precision(number, precision: 2)} €"
  end
end
