class CreateIndustries < ActiveRecord::Migration
  def change
    create_table :industries do |t|
      t.belongs_to :contribution, index: true
      t.string :name
      t.float :total

      t.timestamps
    end
  end
end
