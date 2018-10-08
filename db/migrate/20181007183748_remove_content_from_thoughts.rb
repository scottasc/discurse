class RemoveContentFromThoughts < ActiveRecord::Migration[5.2]
  def change
    remove_column :thoughts, :content, :text
  end
end
