class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    # validate that the user entered a url
    if url_params[:address].size < 0 
      respond_to do |format|
        format.html { render :index, notice: 'Hold up, You need a valid URL to shrink!' }
      end
    end

    @url = Url.new(url_params)

    respond_to do |format|
      begin
        if @url.save
          format.html { render :index, notice: 'Here you go!.' }
        end
      rescue ActiveRecord::RecordNotUnique
        format.html { render :index, notice: 'Here you go!.' }
      end
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_url
    @url = Url.where(id: params[:id]).first
  end

  def url_params
    params.require(:url).permit(:address, :url)
  end
end
