class CategoriesController < ApplicationController
  before_action :categories
    def index;
    
    end
  
    def show
      @category = Category.find(params[:id])
      @sneakers = @category.sneakers

pagination
respond_to do |format|
  format.js
  format.html
end
    end
    def categories
      @categories ||= Category.all
    end
  end