classdef Sphere < handle
    %UNTITLED3 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        center
        radius
        material
    end
    
    methods
        function obj = Sphere(center, radius, material)
            %UNTITLED3 Construct an instance of this class
            %   Detailed explanation goes here
            obj.center = center;
            obj.radius = radius;
            obj.material = material;
        end
        
        function distance = hitByLight(obj, source) % source is source of light which is a Ray object
            distance = nan; 
            sphere_to_ray = source.source.subtract(obj.center);
            
            a = 1;
            b = 2* source.direction.dot_prod(sphere_to_ray);
            c = sphere_to_ray.dot_prod(sphere_to_ray) - (obj.radius * obj.radius);
            discriminant = (b*b) - (4*a*c);
            
            if discriminant >= 0
                dist = (-b - (discriminant^0.5)) / 2;
                if dist > 0
                    distance = dist;
                end
            end
        end
        
        function normal = normal_at(obj, hit_point)
            diff = hit_point.subtract(obj.center);
            normal = diff.norm();
        end
    end
end

