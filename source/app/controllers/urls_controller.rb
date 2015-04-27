class UrlsController < ApplicationController
  def index
    @url = Url.all
  end

  def show
    @url = Url.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @url }
    end
  end

  def new
    @url = Url.new
    @shortened_url = Url.find(params[:short_url]) if params[:short_url]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end

  def create
    @url = Url.new(url_params)
    @url_test = Url.find_by original_url: @url.original_url

    respond_to do |format|
      if @url_test
          format_view(format, @url_test)
      else
        if @url.save
          format_view(format, @url)
        else
          format.html { render action: "new" }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
      end
    end
  end

  def redirect_short
    respond_to do |format|
      if params[:short_extension]
        @url = Url.find_by short_extension: params[:short_extension]
        Url.increment_counter :click_count, @url.id
        format.html { redirect_to @url.original_url }
      else
        format.html { redirect_to root_url, warning: "Shortened URL doesn't exist" }
      end
    end
  end

  private
    def url_params
      params.require(:url).permit(:original_url, :short_url, :click_count, :short_extension)
    end

    def format_view(format, url)
      format.html { redirect_to root_url(short_url: url), notice: 'Url was shortened!' }
      format.json { render json: url, status: :created, location: url }
    end
end
