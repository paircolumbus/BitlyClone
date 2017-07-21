require 'rails_helper'

RSpec.describe "links/show", type: :view do
  before(:each) do
    @link = assign(:link, Link.create!(
      :old_url => "Old Url",
      :new_url => "New Url"
    ))
  end

  xit "renders attributes in <p>" do
    render
    expect(rendered).to match(/Old Url/)
    expect(rendered).to match(/New Url/)
  end
end
