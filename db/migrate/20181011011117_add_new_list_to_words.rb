class AddNewListToWords < ActiveRecord::Migration[5.2]
  def change
    add_column :words, :valence, :decimal, precision: 4, scale: 2
    add_column :words, :arousal, :decimal, precision: 4, scale: 2
    add_column :words, :dominance, :decimal, precision: 4, scale: 2
  end
end
