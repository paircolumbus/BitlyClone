
require 'net/http'

class UrlValidator < ActiveModel::EachValidator

  def validate_each(record, attribute, value)
    value = "http://#{value}" unless /^[a-z]+:\/\// =~ value 
    uri = URI(value)
    return record.errors.add attribute, "must use HTTP or HTTPS" unless ['http','https'].member? uri.scheme
    begin
      page_checker = Net::HTTP.new uri.host, uri.port
      page_checker.use_ssl = uri.scheme.eql? "https"
      page_checker.start do |http|
        response = http.head (uri.path.empty? ? "/" : uri.path)
        puts response.inspect
        return record.errors.add attribute, "is not a valid address according to their server" unless response.code.to_i < 400
      end
    rescue SocketError, Timeout::Error, Errno::EINVAL, Errno::ECONNRESET, EOFError, Net::HTTPBadResponse, Net::HTTPHeaderSyntaxError, Net::ProtocolError => e
      return record.errors.add attribute, "could not be reached for validation"
    end
  rescue URI::InvalidURIError
    record.errors[attribute] = "does not seem to be a valid URL"
  end

end
