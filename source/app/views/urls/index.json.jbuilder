json.array!(@urls) do |url|
  json.extract! url, :id
  json.url url_url(url, format: :json)
end
