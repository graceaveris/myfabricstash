class FabricsController < ApplicationController

  def new
    @user = current_user
    #note, because we are using a modal, the info for the new fabric form is passed via the user#show method! 
  end

  def index
    @fabrics = Fabric.where(["user_id = ?", current_user.id])
    #arrays for add fabric modal
    @fibres = ["Silk", "Cotton", "Linen", "Wool", "Merino", "Modal", "Bamboo", "Cashmere", "Polyester", "Acetate", "Nylon", "Lurex"]
    @suitable_for = ["Pants", "Skirt", "Shirt", "Dress", "T-Shirt", "Shorts", "Activewear", "Sweater", "Jacket", "Coat", "Swimwear"]
    @colours = ["Red", "Blue", "Orange", "Yellow", "Green", "Purple", "Black", "Grey", "Brown", "Pink", "Metallic"]
  end


  def filter
    #This puts all fabrics through through various filters, if filter submitted.
    @filtered = true
    @fabrics = Fabric.where(["user_id = ?", current_user.id])
    @fabrics = @fabrics.with_colour(params[:filter][:colour]) if params[:filter][:colour].present?
    @fabrics = @fabrics.with_fibre(params[:filter][:fibre]) if params[:filter][:fibre].present?
    @fabrics = @fabrics.suitable_for_scope(params[:filter][:suitable_for]) if params[:filter][:suitable_for].present?
 
    #for pre-selection based on prior search. For pre-selects we need to if/else for the defauls. Although there must be a tidier way to do this!!!
    #DEFINES FILTER BAR PRE-SETS
   if (params[:filter][:fibre]) == ""
      @selected_fibre = "Fibre Type"
    else
      @selected_fibre = (params[:filter][:fibre])
   end

   if (params[:filter][:suitable_for]) == ""
      @selected_suitable_for = "Suitable For"
    else
      @selected_suitable_for = (params[:filter][:suitable_for])
   end

   if (params[:filter][:colour]) == ""
    @selected_colour = "Select Colour"
    else
    @selected_colour = (params[:filter][:colour])
   end
    
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
    @fabric = Fabric.find(params[:id])
  end

# DELETE /ponies/1
# DELETE /ponies/1.json
  def destroy
   @fabric = Fabric.find(params[:id])
   @fabric.destroy
   
   respond_to do |format|
      format.html { redirect_to index_fabrics_url }
      format.json { head :no_content }
      format.js { render :layout => false }
   end
  end

#PRIVATE METHOD TO VALIDATE THE NEW FABRIC FORM
  private
  def fabric_params
    params.require(:fabrics).permit(:fabric_name, :fabric_description, :purchased_from, :meterage, :printed, {suitable_for: []}, {colour: []}, {fibre: []}) 
  end
end
