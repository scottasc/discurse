class Practice < ApplicationRecord
  belongs_to :user
  has_many :thoughts

  # calculator method that collects all the dependent thought's data, stores it, then deletes the dependent thoughts. This would require sentiment to be an attribute on the practice model.

end
