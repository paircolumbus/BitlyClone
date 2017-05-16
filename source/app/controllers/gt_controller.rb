
class GtController < ApplicationController

  def show
    @url = Url.find_by short_link: params[:id]
    @url.click_count += 1
    @url.save
    redirect_to @url.link
  end

end
