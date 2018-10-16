class ChangeAnalysisAttributes < ActiveRecord::Migration[5.2]
  def change
    remove_column :thoughts, :valence, :decimal
    remove_column :thoughts, :arousal, :decimal
    remove_column :thoughts, :dominance, :decimal
    add_column :thoughts, :sadness, :decimal, precision: 4, scale: 3
    add_column :thoughts, :joy, :decimal, precision: 4, scale: 3
    add_column :thoughts, :fear, :decimal, precision: 4, scale: 3
    add_column :thoughts, :disgust, :decimal, precision: 4, scale: 3
    add_column :thoughts, :anger, :decimal, precision: 4, scale: 3
    remove_column :practices, :valence, :decimal
    remove_column :practices, :arousal, :decimal
    remove_column :practices, :dominance, :decimal
    add_column :practices, :sadness, :decimal, precision: 4, scale: 3
    add_column :practices, :joy, :decimal, precision: 4, scale: 3
    add_column :practices, :fear, :decimal, precision: 4, scale: 3
    add_column :practices, :disgust, :decimal, precision: 4, scale: 3
    add_column :practices, :anger, :decimal, precision: 4, scale: 3
  end
end
