class RemoveSentimentFromWords < ActiveRecord::Migration[5.2]
  def change
    remove_column :words, :sentiment, :integer
  end
end
