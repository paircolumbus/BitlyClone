require 'rails_helper'

RSpec.describe 'users/show', type: :view do
  before(:each) do
    @user = assign(
      :user,
      User.create!(
        name: 'Name',
        last_name: 'Last Name',
        login: 'Login',
        password: 'Password',
        active: false
      ))
  end

  it 'renders attributes in <p>' do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Login/)
    expect(rendered).to match(/Password/)
    expect(rendered).to match(/false/)
  end
end
