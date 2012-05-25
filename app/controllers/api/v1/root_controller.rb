module Api::V1
  class RootController < ApiController
    def index
      render :json => { :app => "Hello World" }
    end
  end
end