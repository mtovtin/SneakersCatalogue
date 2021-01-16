class Sneaker < ApplicationRecord
    has_one_attached :image
    has_many_attached :images
    has_many :category_sneakers
    has_many :categories, through: :category_sneakers
    has_rich_text :description
    validates :name, presence: true, length: { maximum: 20 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
    validates :name, presence: true, length: { maximum: 20 }
    validates :price, presence: true, numericality: { greater_than_or_equal_to: 1 }
scope :avialability_true, -> { where(avialability: true) }
scope :avialability_false, -> { where(avialability: false) }

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
      def self.import(file)
        spreadsheet = open_spreadsheet(file)
        sheet = spreadsheet.sheet(spreadsheet.sheets[0])
        header = sheet.row(sheet.first_row)
        (sheet.first_row + 1..sheet.last_row).each do |i|
          row = Hash[[header, sheet.row(i)].transpose]
          if row['id'].blank?
            sneaker = Sneaker.find_or_create_by(name: row['name'])
            row['id'] = sneaker.id
          else
            sneaker = Sneaker.find_by(id: row['id'])
          end
          sneaker.update(row)
        end
      end
   
      def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when '.csv' then Roo::Csv.new(file.path)
        when '.xls' then Roo::Excel.new(file.path)
        when '.xlsx' then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
      end
    end
