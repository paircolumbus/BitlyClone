require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :short_url => "Short Url",
      :long_url => "Long Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/Long Url/)
  end
end
