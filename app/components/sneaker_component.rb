# frozen_string_literal: true

class SneakerComponent < ViewComponent::Base
  include SneakersHelper
  def initialize(sneaker:)
    @sneaker = sneaker
  end
end
