require 'rails_helper'

RSpec.describe "links/edit", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :old_url => "MyString",
      :new_url => "MyString"
    ))
  end

  xit "renders the edit link form" do
    render

    assert_select "form[action=?][method=?]", link_path(@link), "post" do

      assert_select "input#link_old_url[name=?]", "link[old_url]"

      assert_select "input#link_new_url[name=?]", "link[new_url]"
    end
  end
end
