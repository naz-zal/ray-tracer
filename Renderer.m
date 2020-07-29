classdef Renderer < handle
    
    % The main engine that handles rendering of the image based on the
    % objects within in the scene, the sources of lighting, etc.
    
    properties
        
    end
    
    methods
        
        function obj = Renderer()
            
        end
        
        function renderedImage = render(obj, scene)
            
            height = scene.height;
            width = scene.width;
            aspectRatio = width/height;
            
            ex0 = -1.0;
            ex1 = 1.0;
            ex_next = (ex1 - ex0) / (width - 1);
            
            y0 = -1.0/aspectRatio;
            y1 = 1.0/aspectRatio;
            y_next = (y1 - y0)/(height - 1);
            
            camera = scene.camera;
            renderedImage = Image(height, width);
            
            for i = 1:height
                y = y0 + (i * y_next);
                for j = 1:width
                    ex = ex0 + (j * ex_next);
                    ray = Ray(camera, (Vector(ex, y, 0).subtract(camera))); % Converting 3D to 2D coordinate system
                    color = obj.ray_trace(ray, scene);                      
                    renderedImage.canvas{i, j}.x = color.x;
                    renderedImage.canvas{i, j}.y = color.y;
                    renderedImage.canvas{i, j}.z = color.z;
                end
            end
            
        end
        
        function color = ray_trace(obj, ray, scene)
            color = Vector(0, 0, 0);
            
            [dist_to_object, object_hit] = obj.nearest(ray, scene);
            if (class(object_hit) ~= "Sphere" && class(object_hit) ~= "Plane")
                return 
            end
            mult = ray.direction.multiply(dist_to_object);
            hit_position = ray.source.add(mult);
            hit_normal = object_hit.normal_at(hit_position);
            color = color.add(obj.color_at(object_hit, hit_position, hit_normal, scene));
        end
        
        function [dist_to_contact, object_hit] = nearest(obj, ray, scene) %name change needed
            dist_to_contact = nan;
            object_hit = nan;
            
            for object = scene.objects_in_scene
                dist = object.hitByLight(ray);
                if ~isnan(dist) && ((class(object_hit) ~= "Sphere" && class(object_hit) ~= "Plane") || dist < dist_to_contact)
                    dist_to_contact = dist;
                    object_hit = object;
                end
            end
        end
        
        function col = color_at(obj, object_hit, hit_pos, normal, scene) 
            material = object_hit.material;
            obj_color = material.color_at();
            view_to_hitpos = scene.camera.subtract(hit_pos);
            K = 50;
            black = hex2rgb('#000000');
            black_vector = Vector(0, 0, 0);
            black_vector.x = black(1);
            black_vector.y = black(2);
            black_vector.z = black(3);
            col = black_vector.multiply(material.ambient);
    
            for light = [scene.lighting]
                light_ray = Ray(light.position, (light.position.subtract(hit_pos)));
                %col = col.add(obj_color.multiply(material.diffuse).multiply(max(normal.dot_prod(light_ray.direction), 0)));
                step1 = max(normal.dot_prod(light_ray.direction), 0);
                dif = material.diffuse; 
                both_mult = step1 * dif; 
                mul_with_obj_color = obj_color.multiply(both_mult);
                col = col.add(mul_with_obj_color);
                
                H = light_ray.direction.add(view_to_hitpos).norm();
                maxFunc = max(normal.dot_prod(H), 0)^(K);
                spec = material.specular; 
                bothMultiply = maxFunc * spec;
                lightcolormult = light.color.multiply(bothMultiply);
                
                col = col.add(lightcolormult); 
                
            end
        end       
    end
end

