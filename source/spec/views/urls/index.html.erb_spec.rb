require 'rails_helper'

RSpec.describe "urls/index", :type => :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        :value => "Value"
      ),
      Url.create!(
        :value => "Value"
      )
    ])
  end

  it "renders a list of urls" do
    render
    assert_select "tr>td", :text => "Value".to_s, :count => 2
  end
end
