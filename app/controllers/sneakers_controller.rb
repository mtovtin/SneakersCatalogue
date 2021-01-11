class SneakersController < ApplicationController
  before_action :categories, only: %i[index search]

        def index
       
          
          @avialability= params[:avialability]
          @sneakers=sneakers.where(avialability: @avialability) if params[:avialability]
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