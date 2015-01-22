require 'rails_helper'

RSpec.describe "urls/edit", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :short_url => "MyString",
      :long_url => "MyString"
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input#url_short_url[name=?]", "url[short_url]"

      assert_select "input#url_long_url[name=?]", "url[long_url]"
    end
  end
end
