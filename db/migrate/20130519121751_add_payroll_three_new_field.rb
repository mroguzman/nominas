class AddPayrollThreeNewField < ActiveRecord::Migration
  def change
    change_table :payrolls do |t|
      t.decimal :indemnification
      t.decimal :indemnification_sec_social
      t.decimal :indemnification_for_transfer
    end
  end
end
