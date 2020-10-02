class City < ApplicationRecord
    extend FriendlyId
    friendly_id :name, use: :slugged
    searchkick word_start: [:name]

    def search_data
        {
            name: name
        }
    end
    
    City.reindex
    
    has_many :sectors
    has_many :streets, through: :sectors
    accepts_nested_attributes_for :sectors
end
