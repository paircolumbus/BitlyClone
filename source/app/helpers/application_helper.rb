module ApplicationHelper
  def count_of_clicks(url)
    return 0 if url.click_count.nil?
    url.click_count
  end
end
