class RemoveDescriptionToSneakers < ActiveRecord::Migration[6.1]
  def change
    remove_column :sneakers, :description
  end
end
