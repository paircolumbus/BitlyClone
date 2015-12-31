class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  # from http://stackoverflow.com/questions/2385799/how-to-redirect-to-a-404-in-rails
  def render_404
    respond_to do |format|
      format.html { render :file => "#{Rails.root}/public/404", :layout => false, :status => :not_found }
      format.xml  { head :not_found }
      format.any  { head :not_found }
    end
  end

  def s
    puts request.original_url
    @url = Url.find_by(shortened: params[:shortened])
    if !@url.nil?
      redirect_to @url.unshortened
      @url.increment_count
    else
      render_404
    end
  end
end
