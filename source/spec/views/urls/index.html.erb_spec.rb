require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :short_url => "Short Url",
        :long_url => "Long Url"
      ),
      Url.create!(
        :short_url => "Short Url",
        :long_url => "Long Url"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Short Url".to_s, :count => 2
    assert_select "tr>td", :text => "Long Url".to_s, :count => 2
  end
end
