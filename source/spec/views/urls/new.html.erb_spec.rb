require 'rails_helper'

RSpec.describe "urls/new", :type => :view do
  before(:each) do
    assign(:url, Url.new())
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do
    end
  end
end
