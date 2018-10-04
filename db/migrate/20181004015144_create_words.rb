class CreateWords < ActiveRecord::Migration[5.2]
  def change
    create_table :words do |t|
      t.string :content
      t.integer :sentiment

      t.timestamps
    end
  end
end
