class CreateFabrics < ActiveRecord::Migration[5.2]
  def change
    create_table :fabrics do |t|

      t.text :fabric_name, limit: 30
      t.text :fabric_description, limit: 120
      t.string :purchased_from
      t.float :meterage
      t.text :fibre, array:true, default: []
      t.text :colour, array:true, default: []
      t.text :suitable_for, array:true, default: []
      t.boolean :printed
      t.string :image
      t.belongs_to :user, index: true
      
      t.timestamps
    end
  end
end