require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :short_url => "Short Url",
      :real_url => "Real Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Short Url/)
    expect(rendered).to match(/Real Url/)
  end
end
