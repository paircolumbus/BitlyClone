module UrlsHelper
  def short_url(url)
    "#{request.base_url}/#{url.short_key}"
  end
end
