class CreateOrganizations < ActiveRecord::Migration
  def change
    create_table :organizations do |t|
      t.belongs_to :contribution, index: true
      t.string, :name
      t.float, :total
      t.float, :employee_total
      t.float :direct_total

      t.timestamps
    end
  end
end
