require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :full_url => "Full Url"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Full Url/)
  end
end
