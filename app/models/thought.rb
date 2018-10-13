class Thought < ApplicationRecord
  belongs_to :practice, optional: true

  def split_words
    self.content.downcase.gsub(/[^a-z0-9\s]/i, '').split
  end

  def emotionalize
    count = self.split_words.count
    vv = 0
    aa = 0
    dd = 0

    self.split_words.each do |element|
      current = Word.find_by(content: element)
      if current
        vv += current.valence
        aa += current.arousal
        dd += current.dominance
      end
    end
    self.valence = vv/count
    self.arousal = aa/count
    self.dominance = dd/count
  end

end
