require 'uri'

class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by unique_key: (params[:unique_key])
    redirect_to @url.address
    Url.increment_counter(:view_counter, @url.id)
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params.require(:url).permit(:address))
    if @url.address =~ /\A#{URI::regexp(['http', 'https'])}\z/
      @url.save
      redirect_to action: "show_key", unique_key: @url.unique_key
    end
  end

  def destroy
    @url = Url.find(params[:id])
    @url.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def show_key
    @url = Url.find_by unique_key: (params[:unique_key])
  end
end