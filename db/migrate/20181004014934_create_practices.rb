class CreatePractices < ActiveRecord::Migration[5.2]
  def change
    create_table :practices do |t|
      t.integer :count
      t.integer :sentiment
      t.integer :user_id

      t.timestamps
    end
  end
end
