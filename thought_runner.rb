require 'http'
word_list = HTTP.get("http://localhost:3000/api/words").parse

######-------############-------############-------######
# CREATING A PRACTICE
######-------############-------############-------######


puts "Would you like to begin a new practice? Type yes or no."
answer = gets.chomp.downcase

if answer == "no"
  puts "Ok, then!"
else
  puts "Great! Enter your user ID:"
  user_id = gets.chomp.to_i
  params = {
            user_id: user_id
            }
  HTTP.post(
            "http://localhost:3000/api/practices",
            form: params
            )
end


#Getting the current practice:

practice_response = HTTP.get("http://localhost:3000/api/practices").parse
current_practice = practice_response.last["id"]

puts "Current practice ID: #{current_practice}"

######-------############-------############-------######
# CREATING A THOUGHT
######-------############-------############-------######

puts "Enter a thought:"
thought = gets.chomp

# Sentamentalizer:

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
puts "Thought sentiment: #{thought_sentiment}"


# Defininf the params and sending them to the API to create the thought:

params = {
          content: thought,
          sentiment: thought_sentiment,
          practice_id: current_practice
          }

HTTP.post(
          "http://localhost:3000/api/thoughts",
          form: params
          )

# Getting the average thought sentiment for a practice:

practice_thoughts = HTTP.get("http://localhost:3000/api/practices/#{current_practice}").parse["thoughts"]
practice_sentiment = ((practice_thoughts.map { |thought| thought["sentiment"].to_f }.sum)/practice_thoughts.count).round(2)

puts "Total thoughts this practice: #{practice_thoughts.count}"
puts "This practice's overall sentiment is #{practice_sentiment}."

# assigning the practice_sentiment to the practice and deleting the dependent thoughts

puts "Would you like to end this session? Your thoughts will be deleted. Your sentiment will live on."

 #MODEL METHOD ^ ^ ^ ^

















