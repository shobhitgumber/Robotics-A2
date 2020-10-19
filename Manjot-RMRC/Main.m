EnvironmentGen();


Brick1Tr = transl(1, 1.4, 1)*troty(-pi);
BrickTr = transl(1, 1.7, 1)*troty(-pi);

qkino = zeros(1, 6); 
robot1base = [0.2, 1.5, 0.83]; %Base of the robot offset 
robot = kino('kino', robot1base); %Initializing Robot 1
hold on;
robot.model.base = transl(robot1base) * trotz(-pi);
robot.model.animate(qkino) %Animate UR3

Brick_1 = ImportPly('IngBottle.ply', Brick1Tr);
Brick = ImportPly('IngBottle2.ply', BrickTr);

disp('PRESS ANY KEY TO ADD SAUCE 1 - PHASE 1...');
pause;

%% PHASE 1 MOVING FIRST SAUCE BOTTLE To Pizza
camlight;

UR5Movement1 = transl(Brick1Tr(1,4), Brick1Tr(2,4), 0.95);
UR3Movement2Tr = Brick1Tr*trotx(pi)*trotz(-pi);
UR5Movement = [UR5Movement1,UR3Movement2Tr];
kino.Move(robot, UR5Movement, [] );


T2 = transl(0,0.5,1.1);
T3 = transl(0,0.5,1.1)*trotx(-3*pi/2);
UR5Movement = [T2,T3];
kino.Move(robot, UR5Movement, Brick_1 );


disp('PRESS ANY KEY TO RESET ROBOT ARM - PHASE 2...');
pause;

%% PHASE 2 - RESET 
 
T4= transl(1, 1.4,0.25)
UR5Movement = [T3,T2,UR5Movement1, T4];
kino.Move(robot, UR5Movement, Brick_1 );

T5= transl(0.2, 1.4,1)

UR6Movement = [T5];

kino.Move(robot, UR6Movement, [] );
robot.model.animate(qkino); %Animate UR3

disp('PRESS ANY KEY TO ADD SECOND SAUCE - PHASE 3...');
pause;

%% PHASE 3 - BOTTLE 2 

Movement1 = transl(BrickTr(1,4), BrickTr(2,4), 0.95);
Movement2Tr = BrickTr*trotx(pi)*trotz(-pi);
Movement = [Movement1,Movement2Tr];
kino.Move(robot, Movement, [] );

T6 = transl(Brick1Tr(1,4), Brick1Tr(2,4), 0.95);
T7 = transl(0,0.5,1.1);
T8 = transl(0,0.5,1.1)*trotx(-3*pi/2);
UR5Movement = [T6,T7,T8];
kino.Move(robot, UR5Movement, Brick);


disp('PRESS ANY KEY TO RESET ROBOT ARM - PHASE 4...');
pause;
%% PHASE 4 - RESET 
 
T9= transl(1, 1.7,0.25)
UR5Movement = [T8,T7,T6, T9];
kino.Move(robot, UR5Movement, Brick );

T10= transl(0.2, 1.7,1)

UR6Movement = [T10];

kino.Move(robot, UR6Movement, [] );
robot.model.animate(qkino); %Animate UR3


 




