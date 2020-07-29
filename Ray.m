classdef Ray < handle

    properties
        source
        direction
    end
    
    methods
        function obj = Ray(source, direction)
            obj.source = source;
            obj.direction = direction.norm(); 
        end
    end
    
end

