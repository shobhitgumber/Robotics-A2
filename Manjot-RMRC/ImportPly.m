classdef ImportPly < handle
    
    properties
        F;
        V;
        D; 
        model;
        V_Colours;  
%         movement = MoveUR3();          
    end
   
    % Implements the functions of the ImportPly Class
    methods
        % Constructor
        function self = ImportPly(name, base)
            [self.F, self.V, self.D] = plyread(name, 'tri');  
            ImportObject(self, name);
            self.model.base = base;
            plot3d(self.model, 0, 'delay', 0);   
            drawnow();
        end
        
        function ImportObject(object, name)
            L1 = Link('alpha',0,'a',0,'d',0,'offset',0);
            object.model = SerialLink(L1, 'name', name);
            object.model.faces = {object.F, []};
            object.model.points = {object.V, []};
        end

        end
        end