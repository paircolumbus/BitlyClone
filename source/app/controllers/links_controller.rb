class LinksController < ApplicationController

  def index
    @links = Link.all
    @link = Link.new
  end

  def show
    @link = Link.find_by new_url: params[:new_url]
    @link.update_column(:counter, @link.counter + 1)
    redirect_to @link.old_url
  end

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

  private
    def link_params
      params.require(:link).permit(:old_url, :new_url, :counter)
    end
end
