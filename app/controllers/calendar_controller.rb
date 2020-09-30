class CalendarController < ApplicationController
  def index
    @cities = City.all
    @today = Date.today 
    @this_month = Date.today.month
    @months_of_year = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].rotate(@this_month - 1)
  end
end
