module UrlsHelper
  def url_params
  	params.require(:url).permit(:address)
  end
end
