class ChangeSentimentToDecimal < ActiveRecord::Migration[5.2]
  def change
    change_column :thoughts, :sentiment, :decimal, precision: 4, scale: 2
  end
end
