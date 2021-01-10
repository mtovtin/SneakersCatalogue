class CreateSneakers < ActiveRecord::Migration[6.1]
  def change
    create_table :sneakers do |t|
      t.string :name, null: false
      t.string :description
      t.float :size
      t.float :price
      t.boolean :avialability, default: false, null: false
      t.timestamps
    end
  end
end

