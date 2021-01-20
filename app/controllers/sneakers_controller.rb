class SneakersController < ApplicationController
  before_action :categories, only: %i[index search]

        def index
       
          search
 
          unless (@avialability = params[:avialability]).blank?
            @sneakers = sneakers.where(avialability: @avialability)
          end
          pagination
          respond_to do |format| 
            format.js
            format.html
          end
         
        end
      
    
      
        def show
          @sneaker = Sneaker.find(params[:id])
        end
      
        
        private
        def categories
          @categories ||=Category.all
        
        end
      end