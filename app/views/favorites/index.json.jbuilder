json.array!(@favorites) do |favorite|
  json.extract! favorite, :brewery_id
  json.url favorite_url(favorite, format: :json)
end
