classdef Light < handle
    % The light class will store basic properties of the light such as it
    % position and color. 
    
    properties
        position
        color
    end
    
    methods
        function obj = Light(position, color)
            
            obj.position = position;
            obj.color = color; 
            
        end
    end
end

