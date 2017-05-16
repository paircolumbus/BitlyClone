require 'rails_helper'

RSpec.describe "urls/new", :type => :view do
  before(:each) do
    assign(:url, Url.new(
      :shortcode => "MyString",
      :destination => "MyString"
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input#url_shortcode[name=?]", "url[shortcode]"

      assert_select "input#url_destination[name=?]", "url[destination]"
    end
  end
end
