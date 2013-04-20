class AddCompanyToUser < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.foreign_key :companies
    end
  end
end