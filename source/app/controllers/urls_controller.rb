class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  def index
  end

  def show
  end

  def create
    # validate that the user entered a url
    binding.pry
    if url_params[:address].size < 3 || address_not_uniq 
      flash[:error] = "Hold up! You need to enter a valid address."
      redirect_to :root and return
    end

    @url = Url.new(url_params)

    respond_to do |format|
      begin
        if @url.save
          format.html { render :index }
        end
      rescue ActiveRecord::RecordNotUnique
          flash[:error] = "Hold up! You need to enter a unique address."
          format.html { render :index }
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

  def address_not_uniq
    address = params[:address]
    address.gsub!(/https:\/\/|http:\/\//,'')
    address.gsub!(/www\./,'')
    Url.where(address: address).first.blank?
  end
end
