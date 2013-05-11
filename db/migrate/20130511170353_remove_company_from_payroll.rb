class RemoveCompanyFromPayroll < ActiveRecord::Migration
  def change
    change_table :payrolls do |t|
      t.remove_foreign_key :companies
      t.remove :company_id
    end 
  end
end
