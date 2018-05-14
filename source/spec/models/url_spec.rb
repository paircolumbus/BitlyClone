require 'rails_helper'

RSpec.describe Url, :type => :model do
  let(:url) { Url.new(long_url: 'https://www.google.com/') }

  describe 'long_url' do
    it 'is not an empty string' do
      url.long_url = ''
      expect(url).to_not be_valid
    end

    it 'has a prefix http:// or https://' do
      url.long_url = 'www.google.com'
      expect(url).to_not be_valid

      url.long_url = 'http://www.google.com'
      expect(url).to be_valid

      url.long_url = 'https://www.google.com'
      expect(url).to be_valid
    end
  end
end
