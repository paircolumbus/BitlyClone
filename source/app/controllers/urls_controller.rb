class UrlsController < ApplicationController
  before_action :set_url, only: [:show]

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.find_or_initialize_by(url_params)
    if @url.save
      redirect_to urls_path
    else
      flash[:error] = @url.errors.full_messages
      redirect_to new_url_path(@url)
    end
  end

  def show
    @url.click_count += 1
    @url.save

    redirect_to "#{@url.long_url}"
  end

  private

    def set_url
      @url = Url.find_by(short_url: params[:short_url])
    end

    def url_params
      params.require(:url).permit(:long_url, :short_url)
    end
end
