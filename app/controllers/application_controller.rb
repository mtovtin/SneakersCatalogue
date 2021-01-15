class ApplicationController < ActionController::Base
  before_action :set_locale
    $PER_PAGE = 12
    private
    def set_locale
      I18n.locale = extract_locale || I18n.default_locale
      @locale = params[:locale] = I18n.locale
    end
  
    def default_url_options(options = {})
      {
        locale: I18n.locale
      }.merge options
    end
  
    def extract_locale
      params[:locale] || http_accept_language.compatible_language_from(I18n.available_locales).to_s
    end

def sneakers
  @sneakers||=Sneaker.all
end
def search
  @search = params[:search]
  # find_in_text
  @sneakers = sneakers.where("lower(name) LIKE '%#{params[:search]&.downcase}%'")
end
def pagination
  @count = sneakers.count
  @sneakers = sneakers.page(page).per($PER_PAGE).with_attached_image.includes(:categories)
end
    def page
      @page ||= (params[:page] || 1).to_i
    end
end
