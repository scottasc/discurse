class ChangeModelNameInThoughts < ActiveRecord::Migration[5.2]
  def change
    remove_column :thoughts, :x, :decimal, precision: 4, scale: 4
    remove_column :thoughts, :y, :decimal, precision: 4, scale: 4
    add_column :thoughts, :x_value, :decimal, precision: 4, scale: 4
    add_column :thoughts, :y_value, :decimal, precision: 4, scale: 4
  end
end
