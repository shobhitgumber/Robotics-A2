EnvironmentGen()
qkino = zeros(1, 6); 
robot = kino; %Initializing Robot 1
robot1base = [0.2, 1.5, 0.83]; %Base of the robot offset 
robot.model.base = transl(robot1base) * trotz(-pi/2);
robot.model.animate(qkino) %Animate UR3
%% jtraj shit for now 
T1 = transl(0.965,1.4,0.95)*troty(pi/2); % Sauce 1
Q1 = robot.model.ikcon(T1)

T2 = transl(0,0.2,0.97)*troty(pi/2); % Pizza Base
Q2 = robot.model.ikcon(T2)

T3 = transl(0.965,1.7,0.95)*troty(pi/2); %sauce 2
Q3 = robot.model.ikcon(T3)

T4 = transl(0,3.2,0.85)*troty(pi/2); %Table
Q4 = robot.model.ikcon(T4)



steps = 150; % Used to smoothen the animation out

%% UR5 Operations
%JTraj used  to detemine the matrix of change between start and end point
%of the Robot
matrix1 = jtraj(qkino, Q1, steps);
matrix2 = jtraj(Q1, Q2, steps);
matrix3 = jtraj(Q2, Q3, steps);
matrix4 = jtraj(Q3, Q2, steps);
matrix5 = jtraj(Q2, Q4, steps);
matrix6 = jtraj(Q4, qkino, steps);


%% Simulation for Robot
%Itterations are usedto smoothen the transitions and also to make use of
%the sequence so the robots donot collide.
for i = 1:steps
    robot.model.animate(matrix1(i, :))
    drawnow()
end

for i = 1:steps
    robot.model.animate(matrix2(i, :))
    drawnow()

end
% 
% for i = 1:steps
%     robot1.model.animate(matrix3(i, :))
%     drawnow()
% end
% for i = 1:steps
%     robot1.model.animate(matrix4(i, :))
%     drawnow()
% end
% for i = 1:steps
%     robot1.model.animate(matrix5(i, :))
%     drawnow()
% end
% for i = 1:steps
%     robot1.model.animate(matrix6(i, :))
%     drawnow()
% end