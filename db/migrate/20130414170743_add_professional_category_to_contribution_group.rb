class AddProfessionalCategoryToContributionGroup < ActiveRecord::Migration
  def change
    change_table :contribution_groups do |t| 
      t.remove :name
      t.integer :number
      t.string :professional_category
      t.decimal :min_base_salary
      t.decimal :max_base_salary
    end
  end
end
