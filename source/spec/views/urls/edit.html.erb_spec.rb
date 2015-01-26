require 'rails_helper'

RSpec.describe "urls/edit", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :shortcode => "MyString",
      :destination => "MyString"
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input#url_shortcode[name=?]", "url[shortcode]"

      assert_select "input#url_destination[name=?]", "url[destination]"
    end
  end
end
