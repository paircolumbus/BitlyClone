json.array!(@urls) do |url|
  json.extract! url, :id, :short_url, :real_url
  json.url url_url(url, format: :json)
end
