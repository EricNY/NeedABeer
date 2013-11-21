json.array!(@histories) do |history|
  json.extract! history, :brewery_id, :userID
  json.url history_url(history, format: :json)
end
