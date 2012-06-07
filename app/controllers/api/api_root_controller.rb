module Api
  class ApiRootController < ActionController::Base
    def index
      render :json => {
        :api_versions => {
          :v1 => {
            :href => api_v1_root_url
          }
        }
      }
    end
  end
end