class CreateCategorySneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :category_sneakers do |t|
      t.integer :category_id
      t.integer :sneaker_id

      t.timestamps
    end
  end
end
