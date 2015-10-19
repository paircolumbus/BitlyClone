require 'rails_helper'

RSpec.describe 'users/new', type: :view do
  before(:each) do
    assign(
      :user,
      User.new(
        name: 'MyString',
        last_name: 'MyString',
        login: 'MyString',
        password: 'MyString',
        active: false
      ))
  end

  it 'renders new user form' do
    render

    assert_select 'form[action=?][method=?]', users_path, 'post' do
      assert_select 'input#user_name[name=?]', 'user[name]'
      assert_select 'input#user_last_name[name=?]', 'user[last_name]'
      assert_select 'input#user_login[name=?]', 'user[login]'
      assert_select 'input#user_password[name=?]', 'user[password]'
      assert_select 'input#user_active[name=?]', 'user[active]'
    end
  end
end
