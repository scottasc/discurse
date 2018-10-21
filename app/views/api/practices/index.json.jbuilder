json.array! @practices do |practice|
  json.user_id practice.user_id
  json.id practice.id
  json.thought_count practice.thought_count
  json.sadness practice.sadness
  json.joy practice.joy
  json.fear practice.fear
  json.disgust practice.disgust
  json.anger practice.anger
end

json.total @total