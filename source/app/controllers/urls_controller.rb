class UrlsController < ApplicationController


	def index
		@urls= Url.all
	end

  def create
    @url = Url.new(url_params)

    if !@url.save
     flash[:error] = "Invalid url"
    end

    redirect_to urls_path
  end

	def new
			@url = Url.new
	end

	def show
		@url = Url.find_by_source(params[:id])
		redirect_to @url.destination
	end

	def destroy
		@url = Url.find_by_source(params[:id])
		@url.destroy

		redirect_to urls_path
	end

 	private
  	def url_params
      params.require(:url).permit(:destination)
    end
end

