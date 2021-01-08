class Sneaker < ApplicationRecord
    has_one_attached :image
    has_many_attached :images
    has_many :category_sneakers
    has_many :categories, through: :category_sneakers

    def category_names=(names)
        category_sneakers.delete_all
        names.split(',').map(&:strip).uniq.each do |category_name|
          category_id = Category.find_or_create_by(name: category_name.to_s.downcase).id
          CategorySneaker.create!(sneaker_id: id, category_id: category_id)
        end
      end
      def category_names
        categories.map(&:name).join(' , ')
      end
      def set_image=(src)
        file = URI.parse(src).open
        image.attach(io: file, filename: name)
      rescue OpenURI::HTTPError => e
        pp e
      end
    end
