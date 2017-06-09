class UrlsController < ApplicationController
  def new
  end

  def index
    @urls = Url.all
  end

  def create
    @url = Url.new(url_params)

    @url.save
    redirect_to '/'
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    redirect_to '/'
  end

  def click_link
    @url = Url.find(params[:format])

    new_count = @url.click_count + 1
    @url.update_attribute(:click_count, new_count)

    sleep 0.01
    redirect_to @url.read_attribute('original')
  end

  private
  def url_params
    params.require(:url).permit(:original)
  end
end
