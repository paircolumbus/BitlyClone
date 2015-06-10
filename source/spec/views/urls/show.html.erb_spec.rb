require 'rails_helper'

RSpec.describe "urls/show", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!())
  end

  it "renders attributes in <p>" do
    render
  end
end
