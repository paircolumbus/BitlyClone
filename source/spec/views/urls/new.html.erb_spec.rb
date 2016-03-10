require 'rails_helper'

RSpec.describe "urls/new", type: :view do
  before(:each) do
    assign(:url, Url.new(
      :unshortened => "MyString",
      :shortened => "MyString"
    ))
  end

  it "renders new url form" do
    render

    assert_select "form[action=?][method=?]", urls_path, "post" do

      assert_select "input#url_unshortened[name=?]", "url[unshortened]"

      assert_select "input#url_shortened[name=?]", "url[shortened]"
    end
  end
end
