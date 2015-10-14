class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]
  helper UrlsHelper

  # GET /urls
  def index
    if params.has_key?(:alert)
      flash.now[:alert] = params[:alert]
    end
    @urls = Url.all
  end

  # GET /urls/1
  def show
  end

  def short

    url = Url.build_from_params(params)
    if url == nil
      redirect_to action: "index", alert: "Your URL was not found"
    else
      redirect_to url.original
    end

  end

  # GET /urls/new
  def new
    @url = Url.new
  end


  # GET /urls/1/edit
  def edit
  end

  # POST /urls
  def create
    @url = Url.new(url_params)
    if @url.save
      redirect_to @url, notice: 'Url was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /urls/1
  def update
    if @url.update(url_params)
      redirect_to @url, notice: 'Url was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /urls/1
  def destroy
    @url.destroy
    redirect_to urls_url, notice: 'Url was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url).permit(:original, :shortened)
    end
end
