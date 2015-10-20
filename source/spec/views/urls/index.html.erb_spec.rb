require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :short_url => "Short Url",
        :real_url => "Real Url"
      ),
      Url.create!(
        :short_url => "Short Url",
        :real_url => "Real Url"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Short Url".to_s, :count => 2
    assert_select "tr>td", :text => "Real Url".to_s, :count => 2
  end
end
