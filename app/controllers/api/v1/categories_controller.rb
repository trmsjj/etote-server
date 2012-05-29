module Api::V1
  class CategoriesController < ApiController
    def index
      @categories = Category.all(:include => :documents)
      render :json => @categories
    end
  end
end