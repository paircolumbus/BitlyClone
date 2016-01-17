class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def show
    @url = Url.find_by unique_key: (params[:unique_key])
    Url.increment_counter(:view_counter, @url.id)
    redirect_to @url.address
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(params.require(:url).permit(:address))

    @url.save
    redirect_to action: "show_key", unique_key: @url.unique_key
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
