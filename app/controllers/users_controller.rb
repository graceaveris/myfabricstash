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
  		redirect_to root_path
  	else
  		flash[:warning] = "invalid email or password"
  		redirect_to "signup"
  	end
  end
end
