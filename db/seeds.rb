require 'csv'

path = Rails.root.join('seeds', "../4541final.csv")

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
   Word.create(row.to_hash)
end