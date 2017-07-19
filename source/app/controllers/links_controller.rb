class LinksController < ApplicationController
  before_action :set_link, only: [:update, :destroy]
  before_filter :create_counter, only: [:show]

  def create_counter
    @link.create_counter(new_url)
  end

  def index
    @links = Link.all
    @link = Link.new
  end

  def show
    # @link = Link.find(params[:id])
    # count = @link.counter + 1
    # does it need the s on update_attributes or just update_attribute

    @link = Link.find_by new_url: params[:new_url]

    @link.update_attributes(counter, :counter+1)

    redirect_to @link.old_urls
  end

  def new
    @link = Link.new
    @links = Link.all
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
      params.require(:link).permit(:old_url, :new_url, :counter)
    end
end
