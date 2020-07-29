classdef Vector < handle
    % Insert comment here
    
    properties (Access = public) % can they be accessed outside
        x = 0.0
        y = 0.0
        z = 0.0
    end
    
    methods
        function obj = Vector(x, y, z)
            % Detailed explanation goes here
            obj.x = x;
            obj.y = y;
            obj.z = z;
        end
        
        function outputDot = dot_prod(obj,otherVec)
            % METHOD1 Summary of this method goes here
            % Detailed explanation goes here
            outputDot = (obj.x * otherVec.x) + (obj.y * otherVec.y) + (obj.z * otherVec.z);
        end
        
        function outputMag = magnitude(obj)
            % Comment here
            outputMag = (obj.dot_prod(obj))^(0.5);
        end
        
        function outputNorm = norm(obj)
            % normalize vector
            mag = magnitude(obj);
            obj.x = obj.x / mag;
            obj.y = obj.y / mag;
            obj.z = obj.z / mag;
            outputNorm = obj;
        end
        
        function outputSum = add(obj, otherVec)
            outputSum = Vector(obj.x + otherVec.x, obj.y + otherVec.y, obj.z + otherVec.z);
        end
        
        function outputMult = multiply(obj, num)
            outputMult = Vector(obj.x * num, obj.y * num, obj.z * num);
        end
        
        function outputDiff = subtract(obj, otherVec)
            outputDiff = Vector(obj.x - otherVec.x, obj.y - otherVec.y, obj.z - otherVec.z);
        end
        
        function outputDiv = divide(obj, num)
            outputDiv = Vector(obj.x / num, obj.y / num, obj.z / num);
            %To return a Vector class object
            %vec = [obj.x / num, obj.y / num, obj.z / num];
            %outputDiv = Vector;
            %outputDiv.init(vec(1), vec(2), vec(3));
        end
    end
end

