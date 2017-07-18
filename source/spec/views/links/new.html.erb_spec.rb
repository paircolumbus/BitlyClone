require 'rails_helper'

RSpec.describe "links/new", type: :view do
  before(:each) do
    assign(:link, Link.new(
      :old_url => "MyString",
      :new_url => "MyString"
    ))
  end

  xit "renders new link form" do
    render

    assert_select "form[action=?][method=?]", links_path, "post" do

      assert_select "input#link_old_url[name=?]", "link[old_url]"

      assert_select "input#link_new_url[name=?]", "link[new_url]"
    end
  end
end
