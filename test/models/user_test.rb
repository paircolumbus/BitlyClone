require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(first_name: "Todd", 
                      last_name: "Green", 
                      email: "todd@green.com",
                      password: "password", 
                      password_confirmation: "password")
  end

  test "should be valid" do
    assert @user.valid?
  end

  # first name
  test "first name should be present" do
    @user.first_name = "    "
    assert_not @user.valid?
  end

  test "first name should not be too long" do
    @user.first_name = "a"*51
    assert_not @user.valid?
  end

  # last name
  test "last name should be present" do
    @user.last_name = "    "
    assert_not @user.valid?
  end

  test "last name should not be too long" do
    @user.last_name = "a"*51
    assert_not @user.valid?
  end

  # email
  test "email should be present" do
    @user.email = "    "
    assert_not @user.valid?
  end

  test "email should not be too long" do
    @user.email = "a"*244 + "@example.com"
    assert_not @user.valid?
  end

  test "email validation should accept valid addresses" do
    valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]

    valid_addresses.each do |valid_address|
      @user.email = valid_address
      assert @user.valid?, "#{valid_address.inspect} should be valid"
    end
  end

  test "email validation should reject invalid addresses" do
    invalid_addresses = %w[user@example,com user_at_foo.org user.name@example.
                           foo@bar_baz.com foo@bar+baz.com]
    invalid_addresses.each do |invalid_address|
      @user.email = invalid_address
      assert_not @user.valid?, "#{invalid_address.inspect} should be invalid"
    end
  end

  test "email should be unique" do
    @user2 = @user.dup
    @user2.email.upcase!
    @user.save
    assert_not @user2.valid?
  end

  # password
  test "password should be present" do
    @user.password = @user.password_confirmation = "     "
    assert_not @user.valid?
  end

  test "password should be at least 8 characters in length" do
    @user.password = @user.password_confirmation = "passwor"
    assert_not @user.valid?
  end

end
