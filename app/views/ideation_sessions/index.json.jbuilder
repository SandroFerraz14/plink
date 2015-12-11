json.array!(@ideation_sessions) do |ideation_session|
  json.extract! ideation_session, :id, :name, :description
  json.url ideation_session_url(ideation_session, format: :json)
end
