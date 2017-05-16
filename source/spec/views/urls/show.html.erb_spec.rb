require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :shortcode => "Shortcode",
      :destination => "Destination"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Shortcode/)
    expect(rendered).to match(/Destination/)
  end
end
