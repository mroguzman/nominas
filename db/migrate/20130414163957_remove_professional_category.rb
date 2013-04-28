class RemoveProfessionalCategory < ActiveRecord::Migration
  def change
    change_table :employees do |t|
      t.remove_foreign_key :professional_categories
      t.remove :professional_category_id
    end

    drop_table :professional_categories
  end
end


