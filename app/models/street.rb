class Street < ApplicationRecord
    belongs_to :sector
    has_many :bins_wastes
    has_many :bins_greens
    has_many :bins_recycles
end
