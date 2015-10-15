require 'rails_helper'

RSpec.describe 'urls/index', type: :view do
  before(:each) do
    assign(:urls, [
      Url.create!(
        original: 'Original',
        shortened: 'Shortened'
      ),
      Url.create!(
        original: 'Original',
        shortened: 'Shortened'
      )
    ])
  end

  it 'renders a list of urls' do
    render
    assert_select 'tr>td', text: 'Original'.to_s, count: 2
    assert_select 'tr>td', text: 'Shortened'.to_s, count: 2
    assert_select 'tr>td', text: '0'.to_s, count: 2
  end
end
