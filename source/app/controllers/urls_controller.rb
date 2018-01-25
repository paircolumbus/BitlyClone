class UrlsController < ApplicationController

  # GET /urls
  def index
    @urls = Url.all
    @url = Url.new
  end

  # POST /urls
  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to root_path, notice: 'Url was successfully created.' }
      else
        format.html { redirect_to root_path, notice: @url.errors.full_messages }
      end
    end
  end

  # GET /:shortened_url
  def redirect
    @url = Url.where(shortened_url: params[:shortened_url]).take
    if @url != nil
      @url.update_attribute(:click_count, @url.click_count + 1)
      redirect_to @url.original_url
    else
      redirect_to root_path, notice: 'We couldn\'t find a link for the bitly URL you clicked.'
    end
  end

  private
    def url_params
      params.require(:url).permit(:original_url, :shortened_url, :click_count)
    end
end
