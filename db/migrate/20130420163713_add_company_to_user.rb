class AddCompanyToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.integer :company_id
      t.foreign_key :companies
    end
  end
end