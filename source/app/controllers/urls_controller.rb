class UrlsController < ApplicationController
  before_action :set_url, only: [:edit, :update, :destroy]
  before_action :set_url_by_shortened, only: [:show]

  def index
    @urls = Url.all
  end

  def show
    @url.increment(:click_count); @url.save
    redirect_to @url.original
  end

  def new
    @url = Url.new
  end

  def edit
  end

  def create
    @url = Url.new(url_params)

    respond_to do |format|
      if @url.save
        format.html { redirect_to urls_path, notice: 'Url was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @url.update(url_params)
        format.html { redirect_to urls_path, notice: 'Url was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_path, notice: 'Url was successfully destroyed.' }
    end
  end

  private
    def set_url
      @url = Url.find(params[:id])
    end

    def set_url_by_shortened
      @url = Url.find_by(shortened: params[:shortened])
    end

    def url_params
      params.require(:url).permit(:shortened, :original)
    end
end
