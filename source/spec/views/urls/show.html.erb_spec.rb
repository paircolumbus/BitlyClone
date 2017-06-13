require 'rails_helper'

RSpec.describe "urls/show", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :long_url => "Long Url",
      :short_url => "Short Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Long Url/)
    expect(rendered).to match(/Short Url/)
  end
end
