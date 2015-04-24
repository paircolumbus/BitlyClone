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

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @url }
    end
  end

  def create
    @url = Url.new(url_params)
    respond_to do |format|
      if @url.save
        format.html { redirect_to root_url, notice: 'Url was shortened!' }
        format.json { render json: @url, status: :created, location: @url }
      else
        format.html { render action: "new" }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  private

    def url_params
      def url_params
        params.require(:url).permit(:original_url, :short_url, :click_count, :short_extension)
      end
    end
end
