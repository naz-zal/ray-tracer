classdef Material
    % Material class is used to define properties of the (for first commit)
    % sphere. Reflection is not yet added in commit 1. Change to be made. 
    
    properties
        color
        ambient
        diffuse
        specular
    end
    
    methods
        function obj = Material(color, ambient, diffuse, specular)
            obj.color = color;
            obj.ambient = ambient;
            obj.diffuse = diffuse;
            obj.specular = specular; 
        end
        
        function color = color_at(obj)
            color = obj.color;
        end
    end
end

