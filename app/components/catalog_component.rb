# frozen_string_literal: true

class CatalogComponent < ViewComponent::Base
  def initialize(sneakers:, categories:)
    @sneakers = sneakers
    @categories = categories
  end
end
