json.array!(@urls) do |url|
  json.extract! url, :id, :full_url
  json.url url_url(url, format: :json)
end
