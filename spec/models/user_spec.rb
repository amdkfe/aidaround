require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    before do
      @user = User.create!(email: "ahmad@kafaei.co.uk", 
      username: "ahmad",
      password: "aaaaaa", 
      password_confirmation: "aaaaaa")
      @user2 = User.create!(email: "amdkfe@gmail.com", 
      username: "kafaei",
      password: "bbbbbb", 
      password_confirmation: "bbbbbb")
    end
    it "can be created" do
      expect(@user).to be_valid
      expect(@user2).to be_valid
    end
    it "cannot be created without username & email" do
      @user.username = nil
      @user.email = nil
      expect(@user).to_not be_valid
    end
    it "cannot be created with passwords under 6 characters" do
      @user.password = "12345"
      expect(@user).to_not be_valid
    end
    it "cannot be created with an existing username" do
      @user2.username = "ahmad"
      expect(@user2).to_not be_valid
    end
  end
end
