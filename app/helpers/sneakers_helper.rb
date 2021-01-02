module SneakersHelper
    def sneaker_image(image, width:200, height:200)
        image_tag (image.attached? ? image : '/n.jpg'), width: width, height: height, class: 'image' 
    end
end
