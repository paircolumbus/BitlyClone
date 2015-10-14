require 'rails_helper'

RSpec.describe 'urls/index', type: :view do
  before(:each) do
    assign(:urls, [
      Url.create!(target_link: 'http://google.com/'),
      Url.create!(target_link: 'http://www.covermymeds.com/')
    ])
  end

  it 'renders a list of urls' do
    render
  end
end
