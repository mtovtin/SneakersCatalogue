ActiveAdmin.register Sneaker do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  permit_params :name, :description, :size, :price, :image, images: []
  form do |f|
    f.inputs do
      f.input :name
      f.input :description, as: :text
      f.input :size
      f.input :price
      f.input :image, as: :file
      f.input :images, as: :file, input_html: {multiple: true}
    end
    f.actions
  end

  show do
    attributes_table do
      row :name
      row :description, as: :text
      row :size
      row :price
      row :image do |object|
        image_tag object.image
      end
      row :images do |object|
        ul do
        object.images.each do |image|
          span image_tag image
    end
  end
  end
end
    active_admin_comments
  end
  #
  # or
  #
  # permit_params do
  #   permitted = [:name, :description, :size, :price]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  
end
