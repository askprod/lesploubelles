class Street < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged

    belongs_to :sector
    has_one :city, through: :sector
    has_many :bin_wastes
    has_many :bin_greens
    has_many :bin_recycles
end
