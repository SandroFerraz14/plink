json.array!(@ideas) do |idea|
  json.extract! idea, :id, :user_id, :ideation_session_id, :text, :color, :number
  json.url idea_url(idea, format: :json)
end
