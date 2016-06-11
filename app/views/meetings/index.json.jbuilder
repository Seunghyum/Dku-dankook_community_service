json.array!(@meetings) do |meeting|
  json.extract! meeting, :id, :name, :start_time, :name, :content
  json.url meeting_url(meeting, format: :json)
end
