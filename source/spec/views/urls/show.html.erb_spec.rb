require 'rails_helper'

RSpec.describe 'urls/show', type: :view do
  before(:each) do
    @url = assign(
      :url,
      Url.create!(
        original: 'Original',
        shortened: 'Shortened'
      )
    )
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Original/)
    expect(rendered).to match(/Shortened/)
  end
end
