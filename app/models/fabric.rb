class Fabric < ApplicationRecord
    belongs_to :user
    scope :print_scope, -> (print) { where("printed = ? ", true) } #NOT IN USE
    scope :plain_scope, -> (print) { where("printed = ? ", false) } #NOT IN USE
    scope :with_colour, -> (colour) { where(":colour = ANY(colour)", colour: colour ) }
    scope :suitable_for_scope, -> (suitable_for) { where(":suitable_for = ANY(suitable_for)", suitable_for: suitable_for ) }
    scope :with_fibre, -> (fibre) { where(":fibre = ANY(fibre)", fibre: fibre ) }
end



