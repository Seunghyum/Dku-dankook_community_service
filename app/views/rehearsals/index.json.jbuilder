json.array!(@rehearsals) do |rehearsal|
  json.extract! rehearsal, :id, :name, :l_type, :time, :ranking
  json.url rehearsal_url(rehearsal, format: :json)
end
