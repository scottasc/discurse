# MVP CSV SEED:

# Bing Liu, Minqing Hu and Junsheng Cheng.
# "Opinion Observer: Analyzing and Comparing Opinions on the Web."
# Proceedings of the 14th International World Wide Web conference (WWW-2005), May 10-14, 2005, Chiba, Japan.

require 'csv'

path = Rails.root.join('seeds', "../mvp_word_list.csv")

CSV.foreach(path, :headers => true, encoding: "UTF-8") do |row|
   Word.create(row.to_hash)
end