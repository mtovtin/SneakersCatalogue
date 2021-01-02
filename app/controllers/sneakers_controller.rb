class SneakersController < ApplicationController
    def index
        @sneakers=Sneaker.all
    end

    def show
        @sneaker=Sneaker.find(params[:id])
    end

    def search
        @search=params[:search]
        @sneakers=Sneaker.where("name LIKE '%#{params[:search]}%'")
    end
end
