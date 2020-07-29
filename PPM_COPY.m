% This function poops out PPM images

function ppm_image = PPM_COPY()
    import Vector
    import Image
    
    IM_HEIGHT = 2;
    IM_WIDTH = 3;
    ppm_image = Image(IM_HEIGHT, IM_WIDTH);
    
    red = Vector(1, 0, 0);
    green = Vector(0, 1, 0);
    blue = Vector(0, 0, 1);
    
    ppm_image.canvas{1, 1} = red;
    ppm_image.canvas{1, 2} = green;
    ppm_image.canvas{1, 3} = blue;
    
    ppm_image.canvas{2, 1} = red.add(green);
    ppm_image.canvas{2, 2} = red.add(green.add(blue));
    ppm_image.canvas{2, 3} = red.multiply(0.001);
    
    ppm_image.write_to_file()
    
end


