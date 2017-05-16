class Url < ActiveRecord::Base
  before_save :shorten

  validates :shortened, uniqueness: true
  validate :protocol_check, :resolvable_check

  def shorten
    self.shortened ||= SecureRandom.urlsafe_base64(5)
  end

  def protocol_check
    errors[:original] <<  "URL must begin with http:// or https://" unless original.match(/^https?:\/\//)
  end

  def resolvable_check
    begin
      HTTParty.get(original).code == 200
    rescue
      errors[:original] << "not resolvable"
    end
  end
end
