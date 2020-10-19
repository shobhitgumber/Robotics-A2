
classdef kino < handle
    
    properties
        model; 
        F;
        V;
        D;
        vertical_reach;
        horizontal_reach;
        workspace = [-3 3 -3 3 -1 2];
    end
    
    methods
        
        % Constructor
        function self = kino(name, base_position)
            GetkinoRobot(self, name, base_position);
            PlotAndColourRobot(self);
        end
       
        
        function GetkinoRobot(self, name, base_position)
          
             L1 = Link('d',0.2848,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360 360]),'offset',0);
            L2= Link('d',0.0054,'a',0.41,'alpha',-pi,'qlim',deg2rad([-90 90]),'offset',-pi/2);
            L3 = Link('d',0.0064,'a',0,'alpha',-pi/2,'qlim',deg2rad([-170 170]),'offset',-pi/2);
            L4 = Link('d',0.2084 + 0.1059,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360 360]),'offset',0);
            L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',deg2rad([-90 90]),'offset',0);
            L6 = Link('d',0.1059 + 0.06153,'a',0,'alpha',0,'qlim',deg2rad([-360 360]),'offset',0);

            
            
            
            self.model = SerialLink([L1 L2 L3 L4 L5 L6],'name',name);
            self.model.base = se3(se2(base_position));
     
        end
%       TAKEN FROM UR5 CLASS
        function PlotAndColourRobot(self)
            for linkIndex = 0:self.model.n
                [ F, V, D{linkIndex + 1} ] = plyread(['Kino_Link',num2str(linkIndex),'.ply'],'tri');
                 self.model.points{linkIndex + 1} = V;
                 self.model.faces{linkIndex + 1} = F;
               
            end
            self.model.plot3d(zeros(1,self.model.n),'wrist' ...
                 , 'arrow','workspace' ...
                 ,self.workspace, 'delay', 0);
             
            axis([self.workspace(1) self.workspace(2) self.workspace(3) ...
                  self.workspace(4) self.workspace(5) self.workspace(6)]);
              
            if isempty(findobj(get(gca,'Children'),'Type','Light'))
                camlight
            end
            self.model.delay = 0;       
            end
        
    end
    
    methods (Static)
%       TAKEN AND DERIVED FROM LAB EXCERCISES USING TRAPEZOIDAL PROFILE
        function Move(robot, movement, component)
            [rows, cols] = size(movement);
            for i = 1:cols/4
                currentPose = robot.model.getpos()';
                nextPose = robot.model.ikcon(movement(:,(4*i - 3):4*i), currentPose);
                minimumIndex = nextPose' < robot.model.qlim(:,1);
                nextPose(minimumIndex) = robot.model.qlim(minimumIndex,1) + 10*pi/180;
                maximumIndex = robot.model.qlim(:,2) < nextPose';
                nextPose(maximumIndex) = robot.model.qlim(maximumIndex,2) - 10*pi/180;
                [tr_EndEffector, jointVariables] = robot.model.fkine(nextPose);
                steps = 50;
                s = lspb(0,1,steps);
                qMatrix = nan(steps,6);
                for i = 1:steps
                    qMatrix(i,:) = (1-s(i))*currentPose + s(i)*nextPose';
                end
                for movementIndex = 1:size(qMatrix,1)
                    animate(robot.model,qMatrix(movementIndex,:));
                    tr_EndEffector = robot.model.fkine(qMatrix(movementIndex,:));
                    if(0 < size(component))
                        for i = 1:size(component,2)
                            component(i).model.base = tr_EndEffector*trotx(-pi)*trotz(-pi);
                            animate(component(i).model, component(i).model.base);
                        end
                    end
                    drawnow();
                end 
                    end  
                    end
                
    end
end