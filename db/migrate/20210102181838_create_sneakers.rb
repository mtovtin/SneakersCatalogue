class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :name
      t.string :description
      t.float :size
      t.float :price

      t.timestamps
    end
  end
end
