module ApplicationHelper
    def convert_day_to_int(day)
        days_fr = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        days_rails = ["1", "2", "3", "4", "5", "6", "0"]
        new_index = days_fr.find_index(day).to_i
        return days_rails[new_index].to_i
    end
end
