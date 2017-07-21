require 'rails_helper'

RSpec.describe "links/index", type: :view do
  before(:each) do
    assign(:links, [
      Link.create!(
        :old_url => "Old Url",
        :new_url => "New Url"
      ),
      Link.create!(
        :old_url => "Old Url",
        :new_url => "New Url"
      )
    ])
  end

  xit "renders a list of links" do
    render
    assert_select "tr>td", :text => "Old Url".to_s, :count => 2
    assert_select "tr>td", :text => "New Url".to_s, :count => 2
  end
end
