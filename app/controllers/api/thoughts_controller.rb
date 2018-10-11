class Api::ThoughtsController < ApplicationController

  def create

    thought = params[:content]
    thought_parsed = thought.downcase.gsub(/[^a-z0-9\s]/i, '').split
    words_in_thought = thought_parsed.count
    valence = 0
    arousal = 0
    dominance = 0
    count = 0

    thought_parsed.each do |word|
      word_list["words"].each do |hash|
        if word == hash["content"]
          valence += hash["valence"].to_i
          arousal += hash["arousal"].to_i
          dominance += hash["dominance"].to_i
          count += 1
        end
      end
    end
    
    @thought = Thought.new(
                            content: thought,
                            valence: valence,
                            arousal: arousal,
                            dominance: dominance,
                            practice_id: params[:practice_id]
                            )
    @thought.save
  end

  # THEN MOVE THEM DOWN HERE AND MAKE THEM MODEL-CENTRIC, AND THEN MOVE THEM INTO THE MODEL FILE.

end
