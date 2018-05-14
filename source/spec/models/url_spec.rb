require 'rails_helper'

RSpec.describe Url, :type => :model do
  let(:url) { Url.new(long_url: 'https://www.google.com/') }
end
