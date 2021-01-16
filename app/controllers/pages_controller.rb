class PagesController < ApplicationController
  def index
   @sneakers=Sneaker.limit(6).with_attached_image.includes(:categories)
  end
end
