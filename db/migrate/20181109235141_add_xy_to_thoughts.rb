class AddXyToThoughts < ActiveRecord::Migration[5.2]
  def change
    add_column :thoughts, :x, :decimal, precision: 4, scale: 4
    add_column :thoughts, :y, :decimal, precision: 4, scale: 4
  end
end
