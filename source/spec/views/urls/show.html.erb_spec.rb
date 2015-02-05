require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :long_url => "Long Url",
      :short_url => "Short Url",
      :name => "Name",
      :clicks => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Long Url/)
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/1/)
  end
end
