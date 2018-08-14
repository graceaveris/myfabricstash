class UsersController < ApplicationController

  def new
  end

  def create 
  	user = User.new(
        username: params[:username],
        email: params[:email],
        password: params[:password]
  		)
  	if user.save
  		session[:user_id] = user.id
  		flash[:success] = "You're all signed up!"
  		redirect_to user_path(user)
  	else
  		flash[:warning] = "invalid email or password"
  		redirect_to "/signup"
  	end
  end

  def show
    current_user
    @user = User.find(params[:id])
    #as we are using a modal, the details for the form need to be passed in via this show method!
    @fibres = ["Silk", "Cotton", "Linen"]
    @suitable_for = ["Pants", "Skirt", "Shirt"]
    @colours = ["Red", "Blue", "Orange"]
  end

end
