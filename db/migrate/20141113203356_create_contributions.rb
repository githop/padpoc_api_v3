class CreateContributions < ActiveRecord::Migration
  def change
    create_table :contributions do |t|
      t.belongs_to :politician, index: true
      t.float :out_state
      t.float :in_state
      t.float :pac
      t.float :individual

      t.timestamps
    end
  end
end
