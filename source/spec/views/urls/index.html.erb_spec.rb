require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(),
      Url.create!()
    ])
  end

  it "renders a list of urls" do
    render
  end
end
