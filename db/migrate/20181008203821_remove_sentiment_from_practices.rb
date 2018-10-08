class RemoveSentimentFromPractices < ActiveRecord::Migration[5.2]
  def change
    remove_column :practices, :sentiment, :decimal, precision: 4, scale: 2
  end
end
