json.formatted do
  json.practice thought.practice_id
  json.thought_id thought.id
  json.content thought.content
  json.sadness thought.sadness
  json.joy thought.joy
  json.fear thought.fear
  json.disgust thought.disgust
  json.anger thought.anger
end
