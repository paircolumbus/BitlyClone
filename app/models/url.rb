require 'uri'

class Url < ActiveRecord::Base

  belongs_to :user

  JOES_URL_REGEX = /\Ahttps?:\/\//
  URL_REGEX = URI.regexp
  validates :longText,  presence: true, 
                        format: {with: URL_REGEX, message: "Not a valid URI"},
                        format: {with: JOES_URL_REGEX, message: "Joe says no"}

end
