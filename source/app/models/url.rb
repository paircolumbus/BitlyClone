require 'uri'
require 'net/http'

class Url < ActiveRecord::Base
  before_save :ensure_short_link
  validates :linkid, uniqueness: true
  validate :target_link_not_empty, :target_link_must_be_http,
    :target_link_must_be_reachable

  def target_link_not_empty
    return unless errors.empty?
    return unless target_link.blank?
    errors[:target_link] << 'Target URL cannot be blank'
  end

  def target_link_must_be_http
    return unless errors.empty?
    return if target_link.match(%r{\Ahttps?://})
    errors[:target_link] << 'Target URL has an unrecognized scheme'
  end

  def _get_target_response_code
    uri = URI.parse(target_link)
    resp = Net::HTTP.get_response(uri)
    resp.code.to_i
  end

  def target_link_must_be_reachable
    return unless errors.empty?
    return if _get_target_response_code < 400
    errors[:target_link] << 'Target URL is not found'
  rescue URI::InvalidURIError
    errors[:target_link] << 'Target URL is not valid'
    return
  rescue
    errors[:target_link] << 'Target URL is not reachable'
  end

  def ensure_short_link
    return unless linkid.nil? || linkid.empty?
    self.linkid = UrlsHelper.shortened_linkid(target_link)
  end
end
