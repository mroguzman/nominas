class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :nif
      t.string :sec_social_number

      t.integer :company_id
      t.integer :professional_category_id
      t.integer :contribution_group_id

      t.foreign_key :companies
      t.foreign_key :professional_categories
      t.foreign_key :contribution_groups

      t.timestamps
    end
  end
end
