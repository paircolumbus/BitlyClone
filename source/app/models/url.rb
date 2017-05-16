class Url < ActiveRecord::Base
	validates :long_url, format: { with: URI::regexp(%w(http https)), message: "Invalid URL!" }

	before_save :shorten

  validates :short_url, uniqueness: true
  validates :name, presence: true
  

	def shorten
		p "========================Start shorten"
		known_sites = { facebook: :fb, google: :goo}
		if self.short_url.empty?
			p "======================="
			/https:\/\/(?:www.)(\w+).\w{3}\/(.*)((?:\?).*)?/ =~ self.long_url
			p self.long_url
			p $1
			p $2
			self.short_url = known_sites.has_key?($1) ? known_sites[$1] : $1[0..3]
			$2 && self.short_url += $2[0..3]
		end
	end

end
