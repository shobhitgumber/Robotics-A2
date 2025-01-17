classdef kino < handle
    properties
        %> Robot model
        model;
        name;
        base_position=[0 0 0];
        %>
        workspace = [-2 2 -2 2 -0.3 3];   
        
        %> Flag to indicate if gripper is used  
    end
    properties(Access= public)
        gui;
    end
    methods%% Class for kino robot simulation
function self = kino
        
% robot = 
self.gui=app1;
self.gui.inputrobot(self);


self.GetkinoRobot();
% robot = 
%             teach(self.model); %Testing Purposes.
self.PlotAndColourRobot();%robot,workspace);
end

%% GetkinoRobot
% Given a name (optional), create and return a kino robot model
function GetkinoRobot(self)
%     if nargin < 1
        % Create a unique name (ms timestamp after 1ms pause)
        pause(0.001);
        self.name = ['kino',datestr(now,'yyyymmddTHHMMSSFFF')];
%     end
            L1 = Link('d',0.2848,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360 360]),'offset',0);
            L2= Link('d',0.0054,'a',0.41,'alpha',-pi,'qlim',deg2rad([-128.9 128.9]),'offset',-pi/2);
            L3 = Link('d',0.0064,'a',0,'alpha',-pi/2,'qlim',deg2rad([-147.8 147.8]),'offset',-pi/2);
            L4 = Link('d',0.2084 + 0.1059,'a',0,'alpha',-pi/2,'qlim',deg2rad([-360 360]),'offset',0);
            L5 = Link('d',0,'a',0,'alpha',pi/2,'qlim',deg2rad([-120.3 120.3]),'offset',0);
            L6 = Link('d',0.1059 + 0.06153,'a',0,'alpha',0,'qlim',deg2rad([-360 360]),'offset',0);

            

    self.model = SerialLink([ L1 L2 L3 L4 L5 L6 ],'name',self.name);
%     self.model.base= transl(0,0,0)*self.model.base;
                     self.model.base = se3(se2(self.base_position));



end


%% PlotAndColourRobot
% Given a robot index, add the glyphs (vertices and faces) and
% colour them in if data is available 
function PlotAndColourRobot(self)%robot,workspace)
    for linkIndex = 0:self.model.n
            [ faceData, vertexData, plyData{linkIndex+1} ] = plyread(['Kino_Link',num2str(linkIndex),'.ply'],'tri'); %#ok<AGROW>
        
        self.model.faces{linkIndex+1} = faceData;
        self.model.points{linkIndex+1} = vertexData;
    end

    self.model.plot3d(zeros(1,self.model.n),'noarrow','workspace',self.workspace);
    if isempty(findobj(get(gca,'Children'),'Type','Light'))
        camlight
    end  
    self.model.delay = 0;

    % Try to correctly colour the arm (if colours are in ply file data)
    for linkIndex = 0:self.model.n
        handles = findobj('Tag', self.model.name);
        h = get(handles,'UserData');
        try 
            h.link(linkIndex+1).Children.FaceVertexCData = [plyData{linkIndex+1}.vertex.red ...
                                                          , plyData{linkIndex+1}.vertex.green ...
                                                          , plyData{linkIndex+1}.vertex.blue]/255;
            h.link(linkIndex+1).Children.FaceColor = 'interp';
        catch ME_1
            disp(ME_1);

            continue;
        end
    end
end
    end
methods (Static)
      %TAKEN AND DERIVED FROM LAB EXCERCISES USING TRAPEZOIDAL PROFILE
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
                            component(i).model.base = tr_EndEffector*trotx(pi/2)*trotz(pi/2);
                            animate(component(i).model, component(i).model.base);
                        end
                    end
                    drawnow();
                end 
                    end  
                    end
    end
end