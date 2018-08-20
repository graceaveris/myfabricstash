require "rails_helper"

RSpec.describe User, type: :model do

  before(:each) do
    @user = User.create!(username: "Test", email: "steven@gmail.com", password: "hello")
  end

  describe "validation" do
    it "should let a user be created with inputs" do
      expect(@user).to be_valid
    end
  end

end