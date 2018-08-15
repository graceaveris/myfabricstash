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
    @fabrics = @user.fabrics
    #as we are using a modal, the details for the form need to be passed in via this show method!
    @fibres = ["Silk", "Cotton", "Linen", "Wool", "Merino", "Modal", "Bamboo", "Cashmere", "Polyester", "Acetate", "Nylon", "Lurex"]
    @suitable_for = ["Pants", "Skirt", "Shirt", "Dress", "T-Shirt", "Shorts", "Activewear", "Sweater", "Jacket", "Coat", "Swimwear"]
    @colours = ["Red", "Blue", "Orange", "Yellow", "Green", "Purple", "Black", "Grey", "Brown", "Pink", "Metallic"]
  end

end
