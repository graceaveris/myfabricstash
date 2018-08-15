class FabricsController < ApplicationController

  def new
    @user = current_user
    #note, because we are using a modal, the info for the new fabric form is passed via the user#show method! 
  end

  def index
    @fabrics = Fabric.where(["user_id = ?", current_user.id])
    #for add fabric modal
    @fibres = ["Silk", "Cotton", "Linen", "Wool", "Merino", "Modal", "Bamboo", "Cashmere", "Polyester", "Acetate", "Nylon", "Lurex"]
    @suitable_for = ["Pants", "Skirt", "Shirt", "Dress", "T-Shirt", "Shorts", "Activewear", "Sweater", "Jacket", "Coat", "Swimwear"]
    @colours = ["Red", "Blue", "Orange", "Yellow", "Green", "Purple", "Black", "Grey", "Brown", "Pink", "Metallic"]
  end

   def filter
    @fabrics = Fabric.print_scope(params[:filter][:printed])
    @filtered = true
    #for add fabric modal
    @fibres = ["Silk", "Cotton", "Linen", "Wool", "Merino", "Modal", "Bamboo", "Cashmere", "Polyester", "Acetate", "Nylon", "Lurex"]
    @suitable_for = ["Pants", "Skirt", "Shirt", "Dress", "T-Shirt", "Shorts", "Activewear", "Sweater", "Jacket", "Coat", "Swimwear"]
    @colours = ["Red", "Blue", "Orange", "Yellow", "Green", "Purple", "Black", "Grey", "Brown", "Pink", "Metallic"]
    render 'index'
  end

  def create 
      @fabric = Fabric.new(fabric_params)
      @fabric.user_id = current_user.id
      
       if @fabric.save
      redirect_to root_path
     else
      render 'new'
    end
  end

  def show
  end

end

#PRIVATE METHOD TO VALIDATE THE NEW FABRIC FORM
  private
  def fabric_params
    params.require(:fabrics).permit(:fabric_name, :fabric_description, :purchased_from, :meterage, :printed, {suitable_for: []}, {colour: []}, {fibre: []}) 
  end
