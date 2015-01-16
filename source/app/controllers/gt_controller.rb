
class GtController < ApplicationController

  def show
    @url = Url.find_by short_link: params[:id]
    redirect_to @url.link
  end

end
