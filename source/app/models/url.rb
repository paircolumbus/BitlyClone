require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  before_save   :ensure_short_link
  validates :linkid, uniqueness: true
  validate :target_link_not_empty, :target_link_must_be_http, :target_link_must_be_reachable

  def target_link_not_empty
    return unless errors.empty?
    if target_link.empty?
      errors[:target_link] << 'Target URL cannot be blank';
    end
  end

  def target_link_must_be_http
    return unless errors.empty?
    unless target_link.match(%r{^https?://})
      errors[:target_link] << 'Target URL has an unrecognized scheme';
    end
  end

  def target_link_must_be_reachable
    return unless errors.empty?
    begin
      uri = URI.parse(target_link)
      resp = Net::HTTP.get_response(uri)
      if resp.code.to_i >= 400
        errors[:target_link] << 'Target URL is not found'
      end
    rescue URI::InvalidURIError
      errors[:target_link] << 'Target URL is not valid'
      return
    rescue
      errors[:target_link] << 'Target URL is not reachable'
    end
  end

  def ensure_short_link
    if self.linkid.nil? || self.linkid.empty?
      self.linkid = UrlsHelper.shortened_linkid(self.target_link)
    end
  end
end
