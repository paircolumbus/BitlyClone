require 'rails_helper'

RSpec.describe "urls/edit", type: :view do
  before(:each) do
    @url = assign(:url, Url.create!(
      :unshortened => "MyString",
      :shortened => "MyString"
    ))
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do

      assert_select "input#url_unshortened[name=?]", "url[unshortened]"

      assert_select "input#url_shortened[name=?]", "url[shortened]"
    end
  end
end
