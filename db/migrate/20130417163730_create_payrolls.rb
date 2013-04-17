class CreatePayrolls < ActiveRecord::Migration
  def change
    create_table :payrolls do |t|
      t.decimal :salary
      t.decimal :bonus
      t.decimal :overtime
      t.decimal :salary_bonus
      t.decimal :payment_in_kind
      t.decimal :no_bonuses
      t.decimal :social_sec_contribution
      t.decimal :irpf
      t.date :start_date
      t.date :end_date

     t.foreign_key :employees
     t.foreign_key :companies 

      t.timestamps
    end
  end
end
