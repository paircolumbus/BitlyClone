require 'uri'
require 'net/http'

class ResponseValidator < ActiveModel::Validator
  def validate(url)
    uri = URI.parse(url.longText)
    response = Net::HTTP.get_response(uri)
    unless response.code == '200'
      url.errors[:base] << "Website response: #{response.code}"
    end
  end
end

class Url < ActiveRecord::Base

  belongs_to :user

  JOES_URL_REGEX = /\Ahttps?:\/\//
  URL_REGEX = URI.regexp
  validates :longText,  presence: true, 
                        format: {with: URL_REGEX, message: "Not a valid URI"},
                        format: {with: JOES_URL_REGEX, message: "Joe says no"}

  validates_with ResponseValidator

end
