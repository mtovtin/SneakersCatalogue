class Category < ApplicationRecord
    has_many :category_sneakers
    has_many :sneakers, through: :category_sneakers
end
