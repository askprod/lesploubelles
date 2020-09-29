class CalendarController < ApplicationController
  def index
    this_month = Date.today.month - 1
    @months_of_year = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12].rotate(this_month)
  end
end
