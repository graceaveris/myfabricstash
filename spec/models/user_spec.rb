require "rails_helper"

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(username: "Test", email: "grace@gmail.com", password: "hello")
  end

#positive testing // PASS
  describe "new user validation" do
    it "should let a user be created with inputs" do
      expect(@user).to be_valid
    end
  end

#positive testing // PASS
 describe "email validation" do
      it "should make sure a user has not already created an account" do
      @newuser = User.create(username: "Test", email: "grace@gmail.com", password: "hello")
      expect(@newuser).to_not be_valid
    end
  end

end