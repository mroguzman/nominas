module PayrollsHelper
  def years_for_payrolls(payrolls)
    payrolls.map(&:start_date).map(&:year).uniq.sort.reverse
  end
end
