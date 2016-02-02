json.array!(@comments) do |comment|
  json.extract! comment, :id, :participant_id, :idea_id, :body
  json.url comment_url(comment, format: :json)
end
