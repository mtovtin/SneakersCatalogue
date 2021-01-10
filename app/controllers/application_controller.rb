class ApplicationController < ActionController::Base
    $PER_PAGE = 12
    private

def sneakers
  @sneakers||=Sneaker.all
end
def search
  @search = params[:search]
  @sneakers = sneakers.where("name LIKE '%#{params[:search]}%'").or(sneakers.where("description LIKE '%#{params[:search]}%'"))
end
def pagination
  @count = sneakers.count
  @sneakers = sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
end
    def page
      @page ||= (params[:page] || 1).to_i
    end
end
