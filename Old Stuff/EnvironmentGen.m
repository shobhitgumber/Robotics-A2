function EnvironmentGen


% This function use "plyread" function which is available here:
% http://au.mathworks.com/matlabcentral/fileexchange/5355-toolbox-graph/content/toolbox_graph/read_ply.m


doCameraSpin = false;

% Although generally I usually try to use more descriptive variables, to make it easier to view here I will use
% f = faceData;
% v = vertexData;

[f, v, data] = plyread('Oven4.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;
hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [2]
    for yOffset = [0]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
camlight;
view(3);
hold on;

%% Load TABLE
[f, v, data] = plyread('Conv5.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0.1]
    for yOffset = [0]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
view(3);
axis equal;
hold on;

%% Load Side Fence
[f, v, data] = plyread('untitled4.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [-6.5]
    for yOffset = [-4.5,-2.3, 0 , 2.3 , 4.5]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
view(3);
hold on;

%% Load Ingredient table
[f, v, data] = plyread('ingtable2.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0]
    for yOffset = [1.5,-1.5]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
% 
%% Load Fence
[f, v, data] = plyread('fence2.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [2.4,-2.4]
    for yOffset = [2.5,-2.5]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
%% Load Fence
[f, v, data] = plyread('fence2.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0]
    for yOffset = [-2.5]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
%% Load Person
[f, v, data] = plyread('sidefence.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [3.8,-3.8]
    for yOffset = [1.25,-1.25]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;

%% Load Extra Bench
[f, v, data] = plyread('wall4.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [4.6,-4.6]
    for yOffset = [2.8,1.3,-0.2,-1.7]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
%% Load Extra Bench
[f, v, data] = plyread('sidewall4.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [-3.0,0,3.0]
    for yOffset = [-3.2]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
%% Load Extra Bench
[f, v, data] = plyread('dTable.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0]
    for yOffset = [3.8]
        % Then plot the trisurf with offset verticies
        trisurf(f, v(:, 1)+xOffset, v(:, 2)+yOffset, v(:, 3) ...
            , 'FaceVertexCData', vertexColours, 'EdgeColor', 'interp', 'EdgeLighting', 'flat');
    end
end

% Turn on a light (only turn on 1, don't keep turning them on), and make axis equal
hold on;
axis equal;
%% Load Extra Bench
[f, v, data] = plyread('PBase.ply', 'tri');

% Scale the colours to be 0-to-1 (they are originally 0-to-255
vertexColours = [data.vertex.red, data.vertex.green, data.vertex.blue] / 255;

hold on;

% Plot the cubes at the corners of a 10m square room
for xOffset = [0]
    for yOffset = [0]
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


end
