class SessionsController < ApplicationController

  def index
    @url = Url.new
    @latest = Url.last(3)
  end
end
