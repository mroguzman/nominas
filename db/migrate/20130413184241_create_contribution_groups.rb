class CreateContributionGroups < ActiveRecord::Migration
  def change
    create_table :contribution_groups do |t|
      t.string :name

      t.timestamps
    end
  end
end
