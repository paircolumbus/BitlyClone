class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :follow]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.all
  end

  # GET /urls/1
  # GET /urls/1.json
  def show
  end

  def follow
    if @url.nil?
      flash[:success] = "No url exists for the key: #{key}"
      redirect_to action: :index
    elsif
      @url.click!
      redirect_to @url.long_url
    end
  end

  # GET /urls/new
  def new
    @url = Url.new
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to @url, notice: 'Url was successfully created.' }
        format.json { render :show, status: :created, location: @url }
      else
        format.html { render :new }
        format.json { render json: @url.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      if !params[:id].nil?
        @url = Url.find params[:id]
      else
        @url = Url.find_by short_key: params[:key]
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:long_url, :short_url)
    end
end
