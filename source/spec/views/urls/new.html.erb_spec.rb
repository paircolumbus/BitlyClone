require 'rails_helper'

RSpec.describe "urls/new", :type => :view do
  before(:each) do
    assign(:url, Url.new(
      :short_url => "MyString",
      :long_url => "MyString"
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input#url_short_url[name=?]", "url[short_url]"

      assert_select "input#url_long_url[name=?]", "url[long_url]"
    end
  end
end
