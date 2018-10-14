require 'http'

puts "Type begin to start or type data to see dashboard"

answer = gets.chomp

if answer == "data"
  user_data = HTTP.get("http://localhost:3000/api/practices").parse
  puts user_data
end

# else
#   params = {
#             user_id: user_id
#             }
#   HTTP.post(
#             "http://localhost:3000/api/practices",
#             form: params
#             )
# end

# practice_response = HTTP.get("http://localhost:3000/api/practices").parse
# total_practices = practice_response.count
# total_thoughts = 0
# practice_response.each do |practice|
#   total_thoughts += practice["thought_count"]
# end

# practice_response = HTTP.get("http://localhost:3000/api/practices").parse
# current_practice = practice_response.last["id"]

# puts "Current practice ID: #{current_practice}"


puts "Enter a thought:"
thought = gets.chomp

params = {content: thought}

HTTP.post(
          "http://localhost:3000/api/thoughts",
          form: params
          )

# thought_response = HTTP.get("http://localhost:3000/api/thoughts").parse
# last_thought = thought_response.last["formatted"]

# puts "Ratings: #{last_thought}"





















