class Sector < ApplicationRecord
    belongs_to :city
    
    has_many :streets
    has_many :bin_brocantes
end
