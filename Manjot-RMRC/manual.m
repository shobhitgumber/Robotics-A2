EnvironmentGen();
qkino = zeros(1, 6); 
robot = kino; %Initializing Robot 1
robot1base = [0.2, 1.5, 0.83]; %Base of the robot offset 
robot.model.base = transl(robot1base) * trotz(-pi/2);
robot.model.animate(qkino) %Animate UR3

%% Load Extra Bench
[f, v, data] = plyread('PBase.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0]
    for yOffset = [0.25]
        for zOffset =[0.87]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) +zOffset ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
    end
end 

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;

%% Load Bottle
[f, v, data] = plyread('IngBottle.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [1]
    for yOffset = [1.7 1.4]
        for zOffset =[0.83]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) +zOffset ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
    end
end 

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;