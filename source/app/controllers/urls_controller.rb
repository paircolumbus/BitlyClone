class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to '/'
    else
      @urls = Url.all
      render 'index'
    end
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
