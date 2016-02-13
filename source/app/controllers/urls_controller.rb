class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    # validate that the user entered a url
    unless valid_url? 
      flash[:error] = "Hold up! You need to enter a valid address."
      redirect_to :root and return
    end

    @url = Url.new(url_params)

    respond_to do |format|
      begin
        raise ActiveRecord::RecordNotUnique.new(@url) if 
          Url.where(address: url_params[:address]).count > 0 
        format.html { render :index } if @url.save
      rescue ActiveRecord::RecordNotUnique 
        @url = Url.where(address: url_params[:address]).first
        format.html { render :index }
      end
    end
  end

  def destroy
    @url.destroy
    respond_to do |format|
      format.html { redirect_to urls_url, 
                    notice: 'Url was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  def set_url
    @url = Url.where(compressed_id: params[:compressed_id]).first
  end

  def url_params
    params.require(:url).permit(:address, :url)
  end

  def valid_url?
    url_params[:address].size <= 3 || 
      url_params[:address].to_s.match(/^.+\..+/).blank?
  end
end
