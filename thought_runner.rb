require 'http'
word_list = HTTP.get("http://localhost:3000/api/words").parse

# Creating a new practice:

puts "Would you like to begin? Type yes or no."

answer = gets.chomp.downcase

if answer == "no"
  puts "Ok, then!"
else
  puts "Great! Enter your user ID:"
  user_id = gets.chomp.to_i
end

# Setting the practice params:

params = {
      user_id: user_id
      }

# Sending practice params to the API for creation:

HTTP.post(
          "http://localhost:3000/api/practices",
          form: params
          )

#Getting the current practice:

response = HTTP.get("http://localhost:3000/api/practices").parse
current_practice = response["practices"].last["id"]

puts "Current practice ID: #{current_practice}"



# ###########----------------------################

# Creating a thought:


puts "Enter a thought:"
thought = gets.chomp

# Sentamentalizer. This is likely a thought model method.

thought_parsed = thought.downcase.gsub(/[^a-z0-9\s]/i, '').split
words_in_thought = thought_parsed.count
score = 0

thought_parsed.each do |word|
  word_list["words"].each do |hash|
    if word == hash["content"]
      score += hash["sentiment"]
    end
  end
end

thought_sentiment = ((score.to_f/words_in_thought.to_f)*100).round(2)


# Defining params for the creation of the thought:

params = {
          content: thought,
          sentiment: thought_sentiment,
          practice_id: current_practice
          }


# Sending the thought params to the API to be created:

HTTP.post(
          "http://localhost:3000/api/thoughts",
          form: params
          )







