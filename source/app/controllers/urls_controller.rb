class UrlsController < ApplicationController
  def index
    # for now, lets grab them all and pass them to a display page
    @urls = Url.all
  end

  def new
    # default behavior looks good
    @target = ''
    @save_errors = nil
  end

  def _extract_url_errors(url)
    index = [:target_link, :linkid, :base].find { |i| url.errors[i].any? }
    return nil if index.nil?
    url.errors[index]
  end

  def create
    # Actually create the new shortened url
    @target = params[:target_link]
    @errors = nil

    @url = Url.new(target_link: @target)
    if !@url.save
      @errors = _extract_url_errors(@url) ||
                ['Unable to save URL. Please try another.']
      render 'new'
    else
      redirect_to @url
    end
  end

  def show
    @url = Url.find(params[:id])
  end

  # redirect to the long url
  def follow
    url = Url.find_by(linkid: params[:linkid])
    Url.increment_counter(:click_count, url.id)
    redirect_to url.target_link
  end
end
