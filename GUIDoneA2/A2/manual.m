qkino = zeros(1, 6); 
robot = kino; %Initializing Robot 1
robot1base = [0.2, 1.5, 0.83]; %Base of the robot offset 
robot.model.base = transl(robot1base) * trotz(-pi/2);
robot.model.animate(qkino) %Animate UR3