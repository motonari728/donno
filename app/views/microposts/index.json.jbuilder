json.array!(@microposts) do |micropost|
  json.extract! micropost, :id, :content
  json.url micropost_url(micropost, format: :json)
end
