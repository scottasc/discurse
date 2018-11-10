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
    self.green = (255 * self.fear) + (255 * self.disgust)
    self.blue = (255 * self.anger)
  end

  def rgb_to_xy
    hue_red = (self.red.to_f/255).to_f
    hue_green = (self.green.to_f/255).to_f
    hue_blue = (self.blue.to_f/255).to_f

    xx = hue_red * 0.664511 + hue_green * 0.154324 + hue_blue * 0.162028;
    yy = hue_red * 0.283881 + hue_green * 0.668433 + hue_blue * 0.047685;
    zz = hue_red * 0.000088 + hue_green * 0.072310 + hue_blue * 0.986039;

    self.x_value = (xx / (xx + yy + zz)).round(4).to_f;
    self.y_value = (yy / (xx + yy + zz)).round(4).to_f;

  end


end