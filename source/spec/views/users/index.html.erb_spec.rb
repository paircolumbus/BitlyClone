require 'rails_helper'

RSpec.describe "users/index", :type => :view do
  before(:each) do
    assign(:users, [
      User.create!(
        :name => "Name",
        :email => "test@example.com",
        :password => "password"
      ),
      User.create!(
        :name => "Name",
        :email => "test2@example.com",
        :password => "password"
      )
    ])
  end

  it "renders a list of users" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "test@example.com".to_s, :count => 1
    assert_select "tr>td", :text => "test2@example.com".to_s, :count => 1
  end
end
