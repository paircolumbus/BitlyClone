class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def new

  end

  def create
    @url = Url.new(url_params)

    if @url.save
      redirect_to @url
    else
      render 'edit'
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  def edit
    @url = Url.find(params[:id])
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy

    redirect_to urls_path
  end

  def jump
    url = Url.find_by_short_url(params[:key])

    if url.nil?
      redirect_to root_path
    else
      url.update({'click_count': url.click_count + 1})
      redirect_to url.long_url
    end
  end

  private
  def url_params
    params.require(:url).permit(:long_url)
  end
end
