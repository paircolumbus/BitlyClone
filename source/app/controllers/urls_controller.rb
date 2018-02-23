class UrlsController < ApplicationController

  #GET    /urls
  def index
    @urls = Url.all
  end

  #GET    /urls/new
  def new
    @url = Url.new
  end
  #GET    /urls/:id
  def show
    @url = Url.find(params[:id])
  end

  # POST   /urls
  def create
    puts "inside create"
    @url = Url.new(url_params)
    if @url.save
      redirect_to url_path(@url)
    else
      render 'new'
    end
  end

  #DELETE /urls/:id
  def destroy
    @url =Url.find(params[:id])
    if @url.destroy
      redirect_to urls_path
    else

    end
  end

  #GET /:short_url
  def hit_short_url
    puts "inside hit_url"
    url = Url.find_by short_url:  params[:short_url]
    if url
      url.update('click_count' => url.click_count + 1)
      redirect_to url.original_url
    else
      redirect_to root_path
    end

  end

  private
  def url_params
    params.require(:url).permit(:original_url)
  end


end
