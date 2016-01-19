class LinksController < ApplicationController
before_filter :set_link, only: [:edit]

  def index
    @links = Link.all
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    if @link.save
      if current_user
        redirect_to user_path(current_user)
      else
        redirect_to root_path
      end
      flash[:success] = "Link successfully created! Link: localhost:3000/a/#{@link.short_url}"
    else
      flash.now[:danger] = "Link creation unsuccessful."
      render :new
    end
  end

  def show
    find_link
  end

  def edit
  end

  private
  def link_params
    params.require(:link).permit(:long_url, :user_id)
  end

  def set_link
    @link = Link.find(params[:id])
  end

  def find_link
    @link = Link.find_by(short_url: params[:short_url])
    @link.click_count += 1
    if @link.save
      redirect_to @link.long_url
    else
      redirect_to root_path
      flash[:danger] = "An error occurred."
    end
  end
end
