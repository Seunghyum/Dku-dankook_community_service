json.array!(@posts) do |post|
  json.extract! post, :id, :title, :content, :attachment, :user_id, :hits
  json.url post_url(post, format: :json)
end
