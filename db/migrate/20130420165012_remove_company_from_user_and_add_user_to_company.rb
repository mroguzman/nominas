class RemoveCompanyFromUserAndAddUserToCompany < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove_foreign_key :companies
    end
    
    change_table :companies do |t|
      t.foreign_key :users
    end
  end
end
