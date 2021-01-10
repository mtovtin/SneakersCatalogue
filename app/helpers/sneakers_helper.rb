module SneakersHelper
    def sneaker_image(image, width:200, height:200, class_names: "")
        image_tag (image.attached? ? image : '/n.jpg'), width: width, height: height, class: "image #{class_names}" 
    end
end
