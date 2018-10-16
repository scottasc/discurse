class Practice < ApplicationRecord
  belongs_to :user
  has_many :thoughts

  def consolidate_thoughts
    number_of_thoughts = self.thoughts.count
    practice_sadness = 0
    practice_joy = 0
    practice_fear = 0
    practice_disgust = 0
    practice_anger = 0

    self.thoughts.each do |thought|
      practice_sadness += thought.sadness
      practice_joy += thought.joy
      practice_fear += thought.fear
      practice_disgust += thought.disgust
      practice_anger += thought.anger
    end

    self.sadness = practice_sadness/number_of_thoughts
    self.joy = practice_joy/number_of_thoughts
    self.fear = practice_fear/number_of_thoughts
    self.disgust = practice_disgust/number_of_thoughts
    self.anger = practice_anger/number_of_thoughts
    self.thought_count = number_of_thoughts
  end

  def delete_thoughts
    self.thoughts.delete_all
  end


end
