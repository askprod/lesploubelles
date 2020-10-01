class City < ApplicationRecord
    has_many :sectors
    has_many :streets, through: :sectors
    accepts_nested_attributes_for :sectors
end
