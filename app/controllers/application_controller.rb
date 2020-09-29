class ApplicationController < ActionController::Base
    before_action :set_json_list

    def set_json_list
        @json_database = JSON.parse(File.read("app/assets/json/list.json"))
    end

end
