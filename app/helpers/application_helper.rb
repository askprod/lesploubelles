module ApplicationHelper

    def translate_week_name(value)
        days_fr = ["Lundi", "Mardi", "Mercredi", "Jeudi", "Vendredi", "Samedi", "Dimanche"]
        days_en = ["1", "2", "3", "4", "5", "6", "0"]
        new_index = days_fr.find_index(value).to_i
        return days_en[new_index]
    end

    def clean_list_string(string)
        num = string[0]
        day = translate_week_name(string.split(" ")[1])
        return [num, day]
    end

    def current_month_date(string)
        start_date = Date.today.beginning_of_month
        end_date = Date.today.end_of_month

        array = clean_list_string(string)
        weeks_to_skip = array[0].to_i
        week_day = array[1].to_i
 
        result = (start_date..end_date).group_by(&:wday)[week_day][weeks_to_skip - 1]
        # weeks_to_skip -1 because the array starts at 0 and not 1 (which is monday)
        return result.strftime("%d %B %Y") if result
    end

    def next_month_date(string)
        start_date = Date.today.next_month.beginning_of_month
        end_date = Date.today.next_month.end_of_month

        array = clean_list_string(string)
        weeks_to_skip = array[0].to_i
        week_day = array[1].to_i

        result = (start_date..end_date).group_by(&:wday)[week_day][weeks_to_skip - 1]
        return result.strftime("%d %B %Y") if result
    end
end
