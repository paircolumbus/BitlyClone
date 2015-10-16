require 'rails_helper'

RSpec.describe 'users/edit', type: :view do
  before(:each) do
    @user = assign(:user, User.create!(
      name: 'MyString',
      last_name: 'MyString',
      login: 'MyString',
      password: 'MyString',
      active: false
    ))
  end

  it 'renders the edit user form' do
    render

    assert_select 'form[action=?][method=?]', user_path(@user), 'post' do

      assert_select 'input#user_name[name=?]', 'user[name]'

      assert_select 'input#user_last_name[name=?]', 'user[last_name]'

      assert_select 'input#user_login[name=?]', 'user[login]'

      assert_select 'input#user_password[name=?]', 'user[password]'

      assert_select 'input#user_active[name=?]', 'user[active]'
    end
  end
end
