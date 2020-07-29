function [] = Main()
    format long
    
    % Height and Width of the frame
    im_height = 960;
    im_width = 540;
    
    camera = Vector(0, 0, -5);    % positioned at 0, 0, -5.  
    
    
    % Defining light source
    color_lightOne_Hex = '#FFFFFF';
    light1_h2rgb = hex2rgb(color_lightOne_Hex); 
    Light_1 = Vector(0, 0, 0);
    Light_1.x = light1_h2rgb(1);
    Light_1.y = light1_h2rgb(2);
    Light_1.z = light1_h2rgb(3);
    
    
    LightOne = Light(Vector(0.7, -0.5, -10.0), Light_1); % Position and color
    lighting = [LightOne];
    

    % Shading properties of the ball
   
    AMBIENT = 0.05;
    DIFFUSE = 1.0;
    SPECULAR = 1.0;
    
    radius1 = 0.6; 
    hex_of_sphere = '#eb4034';
    xyz = hex2rgb(hex_of_sphere); 
    
    color_vector = Vector(0, 0, 0);
    color_vector.x = xyz(1);
    color_vector.y = xyz(2);
    color_vector.z = xyz(3);
    
    position_of_sphere = Vector(-1, 0, 4);
    material_of_sphere = Material(color_vector, AMBIENT, DIFFUSE, SPECULAR); 
    sphere = Sphere(position_of_sphere, radius1, material_of_sphere);
    
    % Defining properties of Plane 
    
    hex_of_plane = "00FF00";
    xyx = hex2rgb(hex_of_plane);
    
    color_plane = Vector(0, 0, 0);
    color_plane.x = xyx(1);
    color_plane.y = xyx(2);
    color_plane.z = xyx(3);
    material_of_plane = Material(color_plane, AMBIENT, DIFFUSE, SPECULAR); 
    plane = Plane(Vector(0, -1, 0), Vector(0, 1, 0), material_of_plane);    % Not using Plane in first commit 
    
    hex_of_sphere2 = '#32c1ed';
    xyx = hex2rgb(hex_of_sphere2); 
    radius2 = 0.2;
    
    color_vector2 = Vector(0, 0, 0);
    color_vector2.x = xyx(1);
    color_vector2.y = xyx(2);
    color_vector2.z = xyx(3);
    
    position_of_sphere2 = Vector(1, 0, 1);
    material_of_sphere2 = Material(color_vector2, AMBIENT, DIFFUSE, SPECULAR); 
    sphere2 = Sphere(position_of_sphere2, radius2, material_of_sphere2);
    
    % --------------------- Big sphere ----------------------------
    position_of_sphere3 = Vector(0, 10000.5, 1);
    radius3 = 1000.0;
    hex_of_sphere3 = '#FF0000';
    xyy = hex2rgb(hex_of_sphere3); 
    
    color_vector3 = Vector(0, 0, 0);
    color_vector3.x = xyy(1);
    color_vector3.y = xyy(2);
    color_vector3.z = xyy(3);
    
    material_of_sphere3 = Material(color_vector3, AMBIENT, DIFFUSE, SPECULAR); 
    sphere3 = Sphere(position_of_sphere3, radius3, material_of_sphere3);
    
    % --------------------------------------------------------------
                                                                        
    objects_in_scene = [sphere, sphere2];
    
    scene = Scene(camera, objects_in_scene, lighting, im_height, im_width);
    engine = Renderer();
    
    renderedImage = engine.render(scene); 
    renderedImage.write_to_file()
    
end

