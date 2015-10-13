class UrlsController < ApplicationController
  def index
    # for now, lets grab them all and pass them to a display page
    @urls = Url.all
  end

  def new
    # default behavior looks good
    @target = ''
    @save_errors = nil
  end

  def create
    # Actually create the new shortened url
    @target = params[:target]
    @errors = nil

    @url = Url.new(target_link: @target)
    if !@url.save
      case
      when @url.errors[:target_link].any?
        @errors = @url.errors[:target_link]
      when @url.errors[:linkid].any?
        @errors = @url.errors[:linkid]
      when @url.errors[:base].any?
        @errors = @url.errors[:base]
      else
        @errors = ['Unable to save URL. Please try another.'];
      end
      render 'new'
    else
      redirect_to url_path(@url.linkid)
    end
  end

  def show
    @url = Url.find_by(linkid: params[:id])
  end

  # redirect to the long url
  def follow
    url = Url.find_by(linkid: params[:linkid])
    Url.increment_counter( :click_count, url.id )
    redirect_to url.target_link
  end
end
