module StreetsHelper
    def next_pass_date(days)
        today = Date.today
        days_array = []
        days_left = []

        days.each do |d|
            days_array << convert_day_to_int(d)
        end

        days_array.each do |d|
            days_left << today + ((d - today.wday) % 7)
        end
        
        result = days_left.sort_by { |x| (x.to_time - today.to_time).abs }.first
        result.strftime("%A %d %B %Y")
    end
end
