class LinksController < ApplicationController
before_filter :set_link, only: [:show]

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

  def show
  end

  private
  def link_params
    params.require(:link).permit(:long)
  end

  def set_link
    @link = Link.find(params[:id])
  end

end
