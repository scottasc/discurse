class RemoveCountAndSentimentFromPractices < ActiveRecord::Migration[5.2]
  def change
    remove_column :practices, :count, :integer
    remove_column :practices, :sentiment, :integer
  end
end
