class PagesController < ApplicationController
  def index
   @sneakers=Sneaker.limit(4).with_attached_image.includes(:categories)
  end
end
