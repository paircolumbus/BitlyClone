class Url < ActiveRecord::Base
  require 'uri'
  
  before_save :generate_shortened_url

  validates :address, presence: true
  validates :address, format: { with: /\Ahttps?:\/\/.*/, message: "must begin with 'http://' or 'https://'" }

  def generate_shortened_url
  end
end
