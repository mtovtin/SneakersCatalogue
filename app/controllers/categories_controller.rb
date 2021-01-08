class CategoriesController < ApplicationController
    def index
      @categories = Category.all
    end
  
    def show
      @category = Category.find(params[:id])
      @sneakers = @category.sneakers
      @count = @sneakers.count
      @sneakers = @sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
    end
  end