module ApplicationHelper
  def count_of_clicks(url)
    return 0 if url.click_count.nil?
    url.click_count
  end

  def link_name_helper(url)
    return url.unshortened if url.name.nil?
    url.name
  end
end
