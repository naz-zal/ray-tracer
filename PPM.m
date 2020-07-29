% This function poops out PPM images

function ppm_image = PPM()
    import Vector
    
    IM_HEIGHT = 2;
    IM_WIDTH = 3;
    ppm_image = cell(IM_HEIGHT, IM_WIDTH);
    
    red = Vector(1, 0, 0);
    green = Vector(0, 1, 0);
    blue = Vector(0, 0, 1);
    
    ppm_image{1, 1} = red;
    ppm_image{1, 2} = green;
    ppm_image{1, 3} = blue;
    
    ppm_image{2, 1} = red.add(green);
    ppm_image{2, 2} = red.add(green.add(blue));
    ppm_image{2, 3} = red.multiply(0.001);
    
    write_to_file(ppm_image, IM_HEIGHT, IM_WIDTH)
    
end

function [] = write_to_file(ppm, height, width)
    ppm_vector = zeros(2, 3, 3);
    
    foo = fopen("test.ppm", "w");
    fprintf(foo, "P3 %i %i\n255\n", width, height);
    fclose(foo);
    
    for i = 1:height
        for j = 1:width
            ppm{i, j}.x = round(ppm{i, j}.x * (255));
            ppm{i, j}.y = round(ppm{i, j}.y * (255));
            ppm{i, j}.z = round(ppm{i, j}.z * (255));
            
            ppm_vector(i, j, :) = [ppm{i, j}.x, ppm{i, j}.y, ppm{i, j}.z];

            foo = fopen("test.ppm", "a+");
            fprintf(foo, "%i %i %i ", ppm_vector(i, j, :)); 
            fclose(foo);
        end
    end
end

