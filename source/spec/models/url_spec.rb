require 'rails_helper'

RSpec.describe Url, :type => :model do
  let(:valid_attributes) {
    { short_url: 'c35c02c2', real_url: 'http://www.google.com', click_count: 2 }
  }

  let(:valid_attributes_no_short_url) {
    { short_url: '', real_url: 'http://www.google.com', click_count: 2 }
  }

  it "assigns a short_url if none exists upon save" do
    url = Url.create! valid_attributes_no_short_url
    expect(url.short_url).not_to be_empty
  end
end
