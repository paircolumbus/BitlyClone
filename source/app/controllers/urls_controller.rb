class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @url = Url.create(url_params)
    render json: @url
  end

  def get
    @url = Url.find_by(:shortcode => params[:id])
    redirect_to @url.address
  end

  private
  def url_params
    params.permit(:address)
  end
end
