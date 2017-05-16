module UrlsHelper
  module_function
  LINKID_LENGTH = 8

  def shortened_linkid(url)
    Digest::SHA1.base64digest(url)[0, LINKID_LENGTH].tr('+/','-_')
  end
end
