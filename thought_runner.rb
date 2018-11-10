# require 'http'

# puts "Type begin to start or type data to see dashboard"

# answer = gets.chomp

# if answer == "data"
#   user_data = HTTP.get("http://localhost:3000/api/practices").parse
#   puts user_data
# end

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


# puts "Enter a thought:"
# thought = gets.chomp

# params = {content: thought}

# HTTP.post(
#           "http://localhost:3000/api/thoughts",
#           form: params
#           )

# thought_response = HTTP.get("http://localhost:3000/api/thoughts").parse
# last_thought = thought_response.last["formatted"]

# puts "Ratings: #{last_thought}"

  



    red = 100.0
    green = 250.0
    blue = 45.0

    hue_red = (red/255).to_f
    hue_green = (green/255).to_f
    hue_blue = (blue/255).to_f

    puts hue_red
    puts hue_green
    puts hue_blue

    xx = hue_red * 0.664511 + hue_green * 0.154324 + hue_blue * 0.162028;
    yy = hue_red * 0.283881 + hue_green * 0.668433 + hue_blue * 0.047685;
    zz = hue_red * 0.000088 + hue_green * 0.072310 + hue_blue * 0.986039;

    x = (xx / (xx + yy + zz))
    y = (yy / (xx + yy + zz))

    puts x
    puts y




















