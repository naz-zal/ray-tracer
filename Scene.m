classdef Scene < handle
    
    properties
        camera
        objects_in_scene
        lighting
        height
        width
    end
    
    methods
        function obj = Scene(camera, objects_in_scene, lighting, height, width)
            obj.camera = camera;
            obj.objects_in_scene = objects_in_scene;
            obj.lighting = lighting; 
            obj.height = height;
            obj.width = width;
        end
    end
end

