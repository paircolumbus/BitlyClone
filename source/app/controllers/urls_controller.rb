class UrlsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def create
    @url = Url.build_for_url(params[:address])
    render json: @url
  end

  def get
    @url = Url.find_by(:shortcode => params[:id])
    redirect_to @url.address
  end
end
