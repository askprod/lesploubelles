module CalendarHelper
    def translate_week_name(value)
        days_fr = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        days_rails = ["1", "2", "3", "4", "5", "6", "0"]
        new_index = days_fr.find_index(value).to_i
        return days_rails[new_index]
    end

    def clean_list_string(string)
        num = string[0]
        day = translate_week_name(string.split(" ")[1])
        return [num, day]
    end

    def current_month_dates(month, string)
        year = Date.today.year
        start_date = Date.new(year, month).beginning_of_month
        end_date = Date.new(year, month).end_of_month

        array = clean_list_string(string)
        weeks_to_skip = array[0].to_i
        week_day = array[1].to_i
 
        result = (start_date..end_date).group_by(&:wday)[week_day][weeks_to_skip - 1]
        # weeks_to_skip -1 because the array starts at 0 and not 1 (which is Monday)
        return result.strftime("%A %d %B %Y") if result
    end

    def next_debarras(day)
        start_month = Date.new(day.year, day.month).beginning_of_month.month
        end_month = Date.new(day.year, day.month).beginning_of_month.next_month.month
        months = [start_month, end_month]
        selected_dates = []
        selected_places = []
        
        months.each do |month_num|
            @json_database["villes"].each do |ville|
                ville["debarras"]["secteur"].each do |secteur|
                    selected_places << ville["nom"]
                    selected_dates << current_month_dates(month_num, secteur[1])
                end
            end
        end

        #Here we first zip the dates & places to get nested arrays with that data, then we sort them chronologically, then we select the dates that are only after the current day
        combined_data = selected_places.zip(selected_dates).sort_by{|x| [Date.today - x[1].to_date, x[1].to_date]}.reverse.select { |date| date[1].to_time >= day.to_time }

        first_element = combined_data.first
        result = combined_data.select{|n| n[1] == first_element[1]}
        return result
    end
end
