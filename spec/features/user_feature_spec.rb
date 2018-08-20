#using capybara for this test file

#TEST // PASS // CAPYBARA 

require 'rails_helper'

RSpec.describe User, type: :model do
	
context 'create new user' do
	
	scenario 'should be successful' do
		visit '/signup'
		within('form') do
        fill_in 'username', with: 'John'
        fill_in 'email', with: 'email@gmail.com'
        fill_in 'password', with: 'password'
    end
    click_button 'Sign Up'
    expect(page).to have_content('Welcome')
  end
end

end