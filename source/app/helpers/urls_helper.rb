module UrlsHelper
  def short_url(url)
    "#{request.base_url}/#{url.short_key}"
  end

  def link_to_short(url, text=nil)
    link_to_noturbo short_url(url), text
  end

  def link_to_noturbo(href, text=nil, **options)
    content_tag :a, text || href, href: href, data: { turbolinks: false }, **options
  end
end
