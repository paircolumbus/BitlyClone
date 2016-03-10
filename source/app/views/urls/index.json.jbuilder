json.array!(@urls) do |url|
  json.extract! url, :id, :unshortened, :shortened
  json.url url_url(url, format: :json)
end
