json.array!(@urls) do |url|
  json.extract! url, :id, :shortcode, :destination
  json.url url_url(url, format: :json)
end
