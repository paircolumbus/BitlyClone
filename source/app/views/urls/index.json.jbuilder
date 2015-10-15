json.array!(@urls) do |url|
  json.extract! url, :id, :original, :shortened
  json.url url_url(url, format: :json)
end
