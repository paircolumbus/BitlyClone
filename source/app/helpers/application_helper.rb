module ApplicationHelper
  def app_config 
    app_config = Hash.new
    app_config[:dev_url]  = 'localhost:3000'
    app_config[:prod_url] = ''
    app_config 
  end
end
