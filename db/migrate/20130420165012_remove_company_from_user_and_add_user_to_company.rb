class RemoveCompanyFromUserAndAddUserToCompany < ActiveRecord::Migration
  def change
    change_table :users do |t|
      t.remove_foreign_key :companies
      t.remove :company_id
    end

    change_table :companies do |t|
      t.integer :user_id
      t.foreign_key :users
    end
  end
end
