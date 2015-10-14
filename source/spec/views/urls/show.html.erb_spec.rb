require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(target_link: 'http://google.com/'))
  end

  it "renders attributes in <p>" do
    render
  end
end
