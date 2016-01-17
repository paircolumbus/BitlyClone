class UrlsController < ApplicationController

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to link_path(@link)
    else
      redirect_to root_path
    end
  end


  private
  def links_params
    params.require(:link).permit(:long)
  end
end
