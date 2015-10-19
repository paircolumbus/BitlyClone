# CRUD for the urls and redirect for shortened GET
class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  URL_NOT_FOUND = 'Your URL was not found'

  # GET /urls
  def index
    flash.now[:alert] = params[:alert] if params.key?(:alert)
    @urls = Url.all
  end

  # GET /urls/1
  def show
  end

  def short
    url = Url.build_from_params(params)
    if url.nil?
      redirect_to action: 'index', alert: URL_NOT_FOUND
    else
      url.increment('click_count', 1)
      url.save
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

  # Only allow the white list through.
  def url_params
    params.require(:url).permit(:original, :shortened)
  end
end
