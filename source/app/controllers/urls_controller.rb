class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(url_params)

    if Url.exists?(long_url: params[:url][:long_url])
      @url = Url.find_by(long_url: params[:url][:long_url])

      respond_to do |format|
        format.js {render template: 'urls/exists.js.erb'}
      end
      return
    end


    if @url.save
      respond_to do |format|
        format.js
      end
    else
      respond_to do |format|
        format.js {render template: 'urls/invalid.js.erb'}
      end
    end

  end

  def redirect
    if !Url.exists?(short_url: params[:short_url])
      render file: "#{Rails.root}/public/404.html", layout: false, status: 404
      return
    end

    @url = Url.find_by(short_url: params[:short_url])
    puts @url

    new_count = @url.click_count + 1
    @url.update_attribute(:click_count, new_count)

    if @url.save
      redirect_to @url.long_url
    else
      raise ActionController::RoutingError.new('Not Found')
    end
  end

  private

  def url_params
    params.require(:url).permit(:long_url)
  end
end
