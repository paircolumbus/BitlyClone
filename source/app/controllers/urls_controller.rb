class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :edit, :update, :destroy]

  # GET /urls
  # GET /urls.json
  def index
    @urls = Url.order("created_at").last(10).reverse
  end

  def redirect_to_unshortened
    external = Url.find_by(shortened:params[:shortened])
    if external
      external.clicks += 1
      external.save
      redirect_to external.unshortened
    else
      redirect_to root_path
    end
  end

  # POST /urls
  # POST /urls.json
  def create
    @url = Url.new
    unless (params[:url].empty?)
      @url = Url.find_or_create_by(unshortened: params[:url])
      unless @url.shortened
        @url.shorten
      end
      #1/0
      @url.clicks = 0
      respond_to do |format|
        if @url.save
          format.html { redirect_to root_path, notice: "#{@url.full_shortened}"}
          format.json { render :show, status: :created, location: @url }
        else
          format.html { render :new }
          format.json { render json: @url.errors, status: :unprocessable_entity }
        end
      end
    else
      redirect_to action: "index"
    end
  end

  # # PATCH/PUT /urls/1
  # # PATCH/PUT /urls/1.json
  # def update
  #   respond_to do |format|
  #     if @url.update(url_params)
  #       format.html { redirect_to @url, notice: 'Url was successfully updated.' }
  #       format.json { render :show, status: :ok, location: @url }
  #     else
  #       format.html { render :edit }
  #       format.json { render json: @url.errors, status: :unprocessable_entity }
  #     end
  #   end
  # end
  #
  # # DELETE /urls/1
  # # DELETE /urls/1.json
  # def destroy
  #   @url.destroy
  #   respond_to do |format|
  #     format.html { redirect_to urls_url, notice: 'Url was successfully destroyed.' }
  #     format.json { head :no_content }
  #   end
  # end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_url
      @url = Url.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_params
      params.require(:url)
    end
end
