classdef Plane
    %UNTITLED Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        position
        normal
        material
    end
    
    methods
        function obj = Plane(position, normal, material)
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.position = position;
            obj.normal = normal;
            obj.material = material;
        end
        
        function dist = hitByLight(obj, ray)
            
            dist = nan;
            
            ray_dir = ray.direction;
            a = ray_dir.dot_prod(obj.normal); 
            
            if (a ~= 0)
                
                first = obj.position.subtract(ray.source);
                second = first.dot_prod(obj.normal);
                dist = second / (a); 
                
            end
            
        end
        
        function norm = normal_at(obj, hit_pos)
            norm = obj.normal;
        end
    end
end

