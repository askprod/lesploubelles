# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Dir.glob("#{Rails.root}/app/assets/json/*.json").map do |json_file|
    file = JSON.parse(File.read(json_file))

    file["villes"].each_with_index do |city, index_city|
        @this_city = City.create!(name: city["nom"])

        city["secteurs"].each do |sector|
            if sector.has_key?("rues")
                @this_sector = Sector.create!(number: sector["numero"], city: @this_city)
                sector["rues"].each do |street|
                    @this_street = Street.create!(name: street["nom"], sector: @this_sector)

                    weeks_to_skip = sector["debarras"][0]
                    day_of_week = sector["debarras"].split(" ")[1]
                    BinBrocante.create!(day_of_week: day_of_week, weeks_to_skip: weeks_to_skip, sector: @this_sector)
                    BinWaste.create!(days: street["dechets"], street: @this_street)
                    BinRecycle.create(days: street["emballage-et-papier"], street: @this_street)
                    BinGreen.create!(days: street["vegetaux"], street: @this_street)
                end
            else
                @that_sector = Sector.create!(number: sector["numero"], city: @this_city)

                weeks_to_skip = sector["debarras"][0]
                day_of_week = sector["debarras"].split(" ")[1]
                BinBrocante.create!(day_of_week: day_of_week, weeks_to_skip: weeks_to_skip, sector: @that_sector)
            end
        end
    end
end
