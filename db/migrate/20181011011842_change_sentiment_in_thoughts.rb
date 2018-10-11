class ChangeSentimentInThoughts < ActiveRecord::Migration[5.2]
  def change
    remove_column :thoughts, :sentiment, precision: 4, scale: 2
    add_column :thoughts, :valence, :decimal, precision: 4, scale: 2
    add_column :thoughts, :arousal, :decimal, precision: 4, scale: 2
    add_column :thoughts, :dominance, :decimal, precision: 4, scale: 2
  end
end
