class PagesController < ApplicationController
  def index
   @sneakers=Sneaker.limit(4)
  end
end
