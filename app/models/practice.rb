class Practice < ApplicationRecord
  belongs_to :user
  has_many :thoughts

  def end_practice
    number_of_thoughts = self.thoughts.count
    practice_valence = 0
    practice_arousal = 0
    practice_dominance = 0

    self.thoughts.each do |thought|
      practice_valence += thought.valence
      practice_arousal += thought.arousal
      practice_dominance += thought.dominance
    end

    self.valence = practice_valence/number_of_thoughts
    self.arousal = practice_arousal/number_of_thoughts
    self.dominance = practice_dominance/number_of_thoughts
    self.thought_count = number_of_thoughts
    self.thoughts.delete_all
  end

end
