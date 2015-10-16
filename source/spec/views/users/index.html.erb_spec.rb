require 'rails_helper'

RSpec.describe 'users/index', type: :view do
  before(:each) do
    assign(:users, [
      User.create!(
        name: 'Name',
        last_name: 'Last Name',
        login: 'Login',
        password: 'Password',
        active: false
      ),
      User.create!(
        name: 'Name',
        last_name: 'Last Name',
        login: 'Login',
        password: 'Password',
        active: false
      )
    ])
  end

  it 'renders a list of users' do
    render
    assert_select 'tr>td', text: 'Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Last Name'.to_s, count: 2
    assert_select 'tr>td', text: 'Login'.to_s, count: 2
    assert_select 'tr>td', text: 'Password'.to_s, count: 2
    assert_select 'tr>td', text: false.to_s, count: 2
  end
end
