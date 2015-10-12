class UrlsController < ApplicationController
  def index
    # for now, lets grab them all and pass them to a display page
    @urls = Url.all
  end

  def new
    # default behavior looks good
  end

  def create
    # Actually create the new shortened url
    target= params[:target]

    @url = Url.new(target_link: target)
    if !@url.save
      flash[:save_error] = ['Unable to save URL. Please try another.'];
      flash[:target] = target
      render 'new'
    else
      redirect_to url_path(@url.linkid)
    end
  end

  def show
    @url = Url.find_by(linkid: params[:id])
  end

  def follow
    # redirect to the long url
    url = Url.find_by(linkid: params[:linkid])
    redirect_to url.target_link
  end
end
