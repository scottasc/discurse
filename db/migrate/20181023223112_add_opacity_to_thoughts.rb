class AddOpacityToThoughts < ActiveRecord::Migration[5.2]
  def change
    add_column :thoughts, :opacity, :decimal, precision: 2, scale: 1
  end
end
