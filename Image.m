classdef Image
    
    % The image class is used to store the canvas properties as well handle
    % saving the rendered image to a .ppm file. 
    
    properties
        height
        width
        canvas
    end
    
    methods
        function obj = Image(height, width)
            %UNTITLED6 Construct an instance of this class
            %   Detailed explanation goes here
            obj.height = height;
            obj.width = width;
            obj.canvas = cell(obj.height, obj.width);
        end
        
        function [] = write_to_file(obj)
            ppm_vector = zeros(obj.height, obj.width, 3);
    
            foo = fopen("test2.ppm", "w");
            fprintf(foo, "P3 %i %i\n255\n", obj.width, obj.height);
            fclose(foo);
    
            for i = 1:obj.height
                for j = 1:obj.width
                    obj.canvas{i, j}.x = round(max(min(obj.canvas{i, j}.x * (255), 255), 0));
                    obj.canvas{i, j}.y = round(max(min(obj.canvas{i, j}.y * (255), 255), 0));
                    obj.canvas{i, j}.z = round(max(min(obj.canvas{i, j}.z * (255), 255), 0));
            
                    ppm_vector(i, j, :) = [obj.canvas{i, j}.x, obj.canvas{i, j}.y, obj.canvas{i, j}.z];

                    foo = fopen("test2.ppm", "a+");
                    fprintf(foo, "%i %i %i ", ppm_vector(i, j, :)); 
                    fclose(foo);
                end
            end
        end
    end
end

