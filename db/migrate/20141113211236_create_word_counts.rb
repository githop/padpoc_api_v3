class CreateWordCounts < ActiveRecord::Migration
  def change
    create_table :word_counts do |t|
      t.belongs_to :contribution, index: true
      t.float :tfidf
      t.integer :count
      t.string :word

      t.timestamps
    end
  end
end
