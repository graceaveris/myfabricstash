class WelcomeController < ApplicationController
 
  def index
  	#this passes the cu value through to the view
  	current_user
  end

end
