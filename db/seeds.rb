# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

file = JSON.parse(File.read("app/assets/json/json_2.json"))

file["villes"].each_with_index do |city, index_city|
    @this_city = City.create!(name: city["nom"])

    city["secteurs"].each_with_index do |sector, index_sector|
        @this_sector = Sector.create!(number: sector["numero"], city: @this_city)

        weeks_to_skip = sector["debarras"][0]
        day_of_week = sector["debarras"].split(" ")[1]
        BinBrocante.create!(day_of_week: day_of_week, weeks_to_skip: weeks_to_skip, sector: @this_sector)

        sector["rues"].each do |street|
            @this_street = Street.create!(name: street["nom"], sector: @this_sector)
        end
    end
    
end
