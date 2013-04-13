class CreateProfessionalCategories < ActiveRecord::Migration
  def change
    create_table :professional_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
