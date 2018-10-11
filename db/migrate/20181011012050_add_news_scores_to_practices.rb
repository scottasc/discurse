class AddNewsScoresToPractices < ActiveRecord::Migration[5.2]
  def change
    add_column :practices, :valence, :decimal, precision: 4, scale: 2
    add_column :practices, :arousal, :decimal, precision: 4, scale: 2
    add_column :practices, :dominance, :decimal, precision: 4, scale: 2
  end
end
