require 'http'

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

params = {content: thought}

HTTP.post(
          "http://localhost:3000/api/thoughts",
          form: params
          )

# Getting the average thought sentiment for a practice:

practice_thoughts = HTTP.get("http://localhost:3000/api/practices/#{current_practice}").parse["thoughts"]

practice_valence = ((practice_thoughts.map { |thought| thought["valence"].to_f }.sum)/practice_thoughts.count).round(2)
practice_arousal = ((practice_thoughts.map { |thought| thought["arousal"].to_f }.sum)/practice_thoughts.count).round(2)
practice_dominance = ((practice_thoughts.map { |thought| thought["dominance"].to_f }.sum)/practice_thoughts.count).round(2)

puts "Total thoughts this practice: #{practice_thoughts.count}"
puts "Valence this session: #{practice_valence}"
puts "Arousal this session: #{practice_arousal}"
puts "dominance this session: #{practice_dominance}"

# puts "This practice's overall sentiment is #{practice_sentiment}."

# assigning the practice_sentiment to the practice and deleting the dependent thoughts

puts "Would you like to end this session?" # Your thoughts will be deleted. Your sentiment will live on.

# ENDING THE PRACTICE IS JUST SAVING STUFF AND PREVENTING A USER FROM CONTINUING, AND PRESENTING THEM ONLY WITH
# THE OPTION TO START A NEW PRACTICE.




# answer = gets.chomp.downcase

# if answer == "yes"

  #send a patch request to the Practices model to save the sentiments
  #delete all dependent thoughts
  #



 #MODEL METHOD ^ ^ ^ ^

















