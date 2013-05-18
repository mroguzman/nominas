class RemoveSocialSecContributionfromPayroll < ActiveRecord::Migration
  def change
    change_table :payrolls do |t|
      t.remove :social_sec_contribution
    end
  end
end
