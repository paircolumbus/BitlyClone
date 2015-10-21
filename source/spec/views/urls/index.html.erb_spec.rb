require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :short_url => "Short Url",
        :real_url => "http://example.com"
      ),
      Url.create!(
        :short_url => "Short Url",
        :real_url => "https://google.com"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Short Url".to_s
    assert_select "tr>td", :text => "http://example.com".to_s
  end
end
