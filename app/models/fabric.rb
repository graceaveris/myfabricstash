class Fabric < ApplicationRecord
    belongs_to :user
    scope :print_scope, -> (print) { where("printed = ? ", true) }
    scope :with_colour, -> (colour) { where("colour = ?", colour) }
    
end