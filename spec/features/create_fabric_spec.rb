require "rails_helper"

feature "Create fabric", type: :feature do

#FAILING // ISSUE WITH THE USER ID NOT BEING PASSED // COME BACK TO THIS
  before(:each) do
    @user = User.create!(username: "Grace", email: "grace@gmail.com", password: "password")
    visit sign_in_path
    fill_in "email", with: "grace@gmail.com"
    fill_in "password", with: "password"
    user = @user #NEED TO PASS SMT THROUGH BUT PROBABLY NOT HERE.
    click_on "Submit"
  end

# POSITIVE TEST // FAILING

describe "creating fabrics" do
  it "should create a fabric" do
    visit "/fabrics/collection"
    expect(page).to have_content ('YOUR FABRIC COLLECTION')
    click_button "Add Fabric to collection"
    fill_in "fabric[fabric_name]", with: "test"
    fill_in "fabric[fabric_description]", with: "test"
    click_button 'Add Fabric'
    expect(page).to have_content ('Welcome')
  end
end
  
end
