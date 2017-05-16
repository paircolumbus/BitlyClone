require 'rails_helper'

RSpec.describe "urls/edit", :type => :view do
  before(:each) do
    @url = assign(:url, Url.create!())
  end

  it "renders the edit url form" do
    render

    assert_select "form[action=?][method=?]", url_path(@url), "post" do
    end
  end
end
