class LinksController < ApplicationController
  before_action :set_link, only: [:update, :destroy] # May need to re-add :edit up here

  def index
    @links = Link.all
    @link = Link.new
  end

  def show
    redirection = Link.find_by new_url: params[:new_url]
    redirect_to redirection.old_url
  end

  def new
    @link = Link.new
    @links = Link.all
  end

  # def edit
  #   @links = Link.all
  #   #
  # end
  #
  def create
    @link = Link.new(link_params)
    respond_to do |format|
      if @link.save
        format.html { redirect_to links_path }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @link.update(link_params)
        format.html { redirect_to links_path }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @link.destroy
    respond_to do |format|
      format.html { redirect_to links_url }
    end
  end

  private
    def set_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:old_url, :new_url)
    end
end
