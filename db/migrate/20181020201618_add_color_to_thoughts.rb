class AddColorToThoughts < ActiveRecord::Migration[5.2]
  def change
    add_column :thoughts, :red, :integer
    add_column :thoughts, :green, :integer
    add_column :thoughts, :blue, :integer
  end
end
