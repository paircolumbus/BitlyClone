class Url < ActiveRecord::Base
  before_save   :ensure_short_link

  def ensure_short_link
    if self.linkid.nil? || self.linkid.length == 0
      self.linkid = UrlsHelper.shortened_linkid(self.target_link)
    end
  end
end
