class SessionsController < ApplicationController
  before_filter :authenticate_user

  def index
    render :index
  end

  def new
    render :new
  end

  def create
  end

  def destroy
  end

end
