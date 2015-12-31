require 'uri'

class UrlsController < ApplicationController

  def index
    @urls = Url.all
  end

  def create
    name = params[:name]
    unshortened = params[:unshortened]

    if name.nil? || unshortened.nil? || name.empty? || unshortened.empty? || !check_url(unshortened)
      flash[:create_error] = 'An error occured while creating shortened link. Please make sure link provided is valid.'
    else
      Url.create!(unshortened: unshortened, name: name)
    end
    
    redirect_to '/urls'
  end

  private

  def check_url(url)
    val = true
    val = false if url.empty?
    val = false if /^(http\:\/\/|https\:\/\/)/.match(url).nil?
    # from http://stackoverflow.com/questions/1805761/check-if-url-is-valid-ruby
    val = false if (url =~ /\A#{URI::regexp(['http', 'https'])}\z/).nil?
    val
  end

end
