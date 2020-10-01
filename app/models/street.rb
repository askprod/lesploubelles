class Street < ApplicationRecord
    belongs_to :sector
    has_one :city, through: :sector

    has_many :bin_wastes
    has_many :bin_greens
    has_many :bin_recycles
end
