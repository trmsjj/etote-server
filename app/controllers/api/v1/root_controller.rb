module Api::V1
  class RootController < ApiController
    def index
      render :json => {
        :resources => {
          :requests => {
            :href => api_v1_requests_url(),
            :options => ['POST'],
            :content_type => 'application/json',
            :accepts => 'application/json'
          },
          :report => {
            :href => api_v1_report_url(),
            :options => ['GET'],
            :content_type => 'application/json',
            :accepts => 'application/json'
          }
        }
      }
    end
  end
end