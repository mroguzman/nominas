class AddCompanyNewField < ActiveRecord::Migration
  def change
    change_table :payrolls do |t|
      t.string :agreement
      t.integer :payment
      t.decimal :overtime_fm
    end
  end 
end
