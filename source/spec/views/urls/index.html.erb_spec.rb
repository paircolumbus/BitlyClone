require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :shortcode => "Shortcode",
        :destination => "Destination"
      ),
      Url.create!(
        :shortcode => "Shortcode",
        :destination => "Destination"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Shortcode".to_s, :count => 2
    assert_select "tr>td", :text => "Destination".to_s, :count => 2
  end
end
