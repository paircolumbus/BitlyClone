json.array!(@urls) do |url|
  json.extract! url, :id, :value
  json.url url_url(url, format: :json)
end
