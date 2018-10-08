class AddContentToThoughts < ActiveRecord::Migration[5.2]
  def change
    add_column :thoughts, :content, :text
  end
end
