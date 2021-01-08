class SneakersController < ApplicationController

        def index
          @sneakers = Sneaker.all
          @count = @sneakers.count
          @sneakers = @sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
        end
      
        def set_page
          @sneakers= Sneakers.all
          @count = @sneakers.count
          @sneakers = @sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
          respond_to :js
        end
      
        def show
          @sneaker = Sneaker.find(params[:id])
        end
      
        def search
          @search = params[:search]
          @sneakers = Sneaker.where("name LIKE '%#{params[:search]}%'").or(Sneaker.where("description LIKE '%#{params[:search]}%'"))
          @count = @sneakers.count
          @sneakers = @sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
        end
      end