class Url < ActiveRecord::Base
  before_save :sanitize_address
  before_save :compress_id

  def sanitize_address 
    self.address.gsub!(/https:\/\/|http:\/\//,'')
  end

  def compress_id
    self.id = IdCompressor.compress(Url.count + 1)
  end
end
