class FabricsController < ApplicationController

  def new
    @user = current_user
    #note, because we are using a modal, the info for the new fabric form is passed via the user#show method! 
  end

  def index
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
