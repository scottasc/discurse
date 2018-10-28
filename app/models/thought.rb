class Thought < ApplicationRecord
  belongs_to :practice

  def emotionalize
    content = self.content
    natural_language_understanding = IBMWatson::NaturalLanguageUnderstandingV1.new(
                                                                                    username: ENV["USER_NAME"],
                                                                                    password: ENV["PASSWORD"],
                                                                                    version: "2018-03-16"
                                                                                   )

    response = natural_language_understanding.analyze(
                                                      text: "#{content}",
                                                      features: {
                                                                "emotion" => {}
                                                                }
                                                      ).result


    self.sadness = response["emotion"]["document"]["emotion"]["sadness"]
    self.joy = response["emotion"]["document"]["emotion"]["joy"]
    self.fear = response["emotion"]["document"]["emotion"]["fear"]
    self.disgust = response["emotion"]["document"]["emotion"]["disgust"]
    self.anger = response["emotion"]["document"]["emotion"]["anger"]
  end

  def colorize
    self.red = (255 * self.sadness)
    self.green = (255 * self.fear)
    self.blue = (255 * self.anger) + (255 * self.disgust)
  end


end
