require "rails_helper"

RSpec.describe Fabric, type: :model do

  before(:each) do
    @user = User.create!(username: "grace", email: "testemail@gmail.com", password: "password")
    @fabric = Fabric.create!(fabric_name: "I am a fabric", user_id: @user.id)
  end

    describe "fabric validation" do
      it "fabric must have a name" do
      @fabric.fabric_name = nil
      expect(@fabric).to_not be_valid
    end
  end
  
  describe "association" do
    it "should have a user" do
      Fabric.reflect_on_association(:user).macro.should   eq(:belongs_to)
   end
  end

    describe "fabric count" do
      it "count number of fabrics belonging to a user" do
      expect(@user.fabrics.length).to eq(1)
    end
  end

end

#to run - $ bundle exec rspec