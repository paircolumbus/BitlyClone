require 'rails_helper'
include SessionsHelper

# Specs in this file have access to a helper object that includes
# the SessionsHelper. For example:
#
# describe SessionsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe SessionsHelper, :type => :helper do
  let(:valid_attributes) {
    { name: 'Ima Tester', email: 'tester@example.com', password: 'tester' }
  }

  describe "log_in" do
    it "log in as invalid user" do
      log_in(User.create)
      expect(session[:user_id]).to be_nil
    end
    
    it "log in as valid user" do
      user = User.create! valid_attributes
      log_in(user)
      expect(session[:user_id]).not_to be_nil
    end
  end

  describe "log_out" do
    it "log out of account" do
      log_out
      expect(session[:user_id]).to be_nil
    end
  end
  
  describe "current_user" do
    it "get current user" do
      session[:user_id] = 1
      expect(current_user).not_to be_nil
    end
  end

  describe "logged in or not" do
    it "logged_in? while logged in" do
      session[:user_id] = 1
      expect(logged_in?).to be true
    end
    it "logged_in? while NOT logged in" do
      expect(logged_in?).to be false
    end
  end
end
