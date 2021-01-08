class CategorySneaker < ApplicationRecord
    belongs_to :category
    belongs_to :sneaker
end
