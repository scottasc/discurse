class CreateThoughts < ActiveRecord::Migration[5.2]
  def change
    create_table :thoughts do |t|
      t.text :content
      t.integer :sentiment
      t.integer :practice_id

      t.timestamps
    end
  end
end
