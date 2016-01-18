class LinksController < ApplicationController
before_filter :set_link, only: [:edit]
before_filter :find_link, only: [:show]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      redirect_to root_path
    else
      flash.now[:danger] = "Link creation unsuccessful."
      render :new
    end
  end

  def show
  end

  def edit
  end

  private
  def link_params
    params.require(:link).permit(:long_url)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def find_link
    @link = Link.find_by(short_url: params[:short_url])
    @link.increment_counter(:click_count, @link.id)
    redirect_to "http://" + @link.long
  end
end
