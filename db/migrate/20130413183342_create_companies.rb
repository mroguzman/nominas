class CreateCompanies < ActiveRecord::Migration
  def change
    create_table :companies do |t|
      t.string :name
      t.string :cif
      t.string :sec_social_number
      t.string :street

      t.timestamps
    end
  end
end
