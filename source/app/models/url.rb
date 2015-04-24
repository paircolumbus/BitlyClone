class Url < ActiveRecord::Base
  validates :original_url, presence: true, format: { with: URI::regexp,
    message: "Not a valid URL. Be sure to include http or https if necessary." }
end