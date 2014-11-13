class CreateZipcodes < ActiveRecord::Migration
  def change
    create_table :zipcodes do |t|
      t.belongs_to :politician, index: true
      t.string :zip

      t.timestamps
    end
  end
end
