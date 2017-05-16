class Url < ActiveRecord::Base
  include Rails.application.routes.url_helpers

  validates :original_url, presence: true, format: { with: URI::regexp,
    message: "Not a valid URL. Be sure to include http or https if necessary." }

  before_save :shorten

  private
    def shorten
      extention = random
      if Url.find_by_short_extension(random).nil?
        set_short_attributes(extention)
      else
        extention = random
        set_short_attributes(extention)
      end
    end

    def set_short_attributes(extension)
      self.short_url = "#{root_url}#{extension}"
      self.short_extension = extension
    end

    def random
      SecureRandom.hex(3)
    end
end