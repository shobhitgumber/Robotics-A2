%EnvironmentGen();
robot1base = [0.2, 1.5, 0.83];
Brick1Tr = transl(robot1base(1)+0.8, robot1base(2) -0.1, 1)*troty(-pi);
BrickTr = transl(robot1base(1)+0.8, 1.7, 1)*troty(-pi);
Brick2Tr = transl(0, 0.5, 0.87);

qkino = zeros(1, 6); 
robot = kino('kino', robot1base); %Initializing Robot 1
hold on;
robot.model.base = transl(robot1base)*trotz(pi);
robot.model.animate(qkino); %Animate UR3

Brick_1 = ImportPly('IngBottle.ply', Brick1Tr);
Brick = ImportPly('IngBottle2.ply', BrickTr);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);



n = input("FOR BBQ BASE ENTER 1 // FOR TOMATO BASE ENTER 2: ")

switch n 
    case 1 
        disp( "YOU HAVE SELECTED BBQ BASE");
        disp( "APPLYING SAUCE NOW");

        %% PHASE 1 MOVING FIRST SAUCE BOTTLE To Pizza
        camlight;

        UR5Movement1 = transl(Brick1Tr(1,4), Brick1Tr(2,4), 0.95)*trotx(-pi)*trotz(pi);
        UR3Movement2Tr = Brick1Tr*trotx(pi)*trotz(-pi);
        UR5Movement = [UR5Movement1,UR3Movement2Tr];
        kino.Move(robot, UR5Movement, [] );


        T2 = transl(0,0.5,1.1);
        T3 = transl(0,0.5,1.1)*trotx(-3*pi/2);
        UR5Movement = [T2,T3];
        kino.Move(robot, UR5Movement, Brick_1 );

        disp('SAUCE APPLIED...')
        disp('PRESS ANY KEY TO RESET ROBOT ARM - PHASE 2...');
        pause;

        %% PHASE 2 - RESET 
 
        T4= transl(0.5, 0.5,0.25);
        T41= transl(1, 1.4,0.10);

        UR5Movement = [T2,T4,T41];
        kino.Move(robot, UR5Movement, Brick_1 );

        T5= transl(0.2, 1.4,0.95)

        UR6Movement = [T5];

        kino.Move(robot, UR6Movement, [] );
       
        
       
    
    case 2 
       camlight;
       disp( "YOU HAVE SELECTED TOMATO BASE");
       disp( "APPLYING SAUCE NOW");

        %% PHASE 3 - SAUCE BOTTLE 2 
        Movement1 = transl(BrickTr(1,4), BrickTr(2,4), 0.95)*trotx(-pi)*trotz(pi);
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
 
        T4= transl(0.5, 0.5,0.25);
        T41= transl(1, 1.4,0.10);

        UR5Movement = [T2,T4,T41];
        kino.Move(robot, UR5Movement, Brick );

        T5= transl(0.2, 1.4,0.95)

        UR6Movement = [T5];

        kino.Move(robot, UR6Movement, [] );
        
    otherwise 
        
        disp("PLEASE CHOOSE FROM THE OPTIONS, THANK YOU...")
        
        
end


%% PHASE 5 - COOKING PIZZA 


disp('BASE SELECTED, COOKING PIZZA NOW')
%robot.model.animate(qkino); %Animate UR3
Brick2Tr= transl(0.5, 0.5,0.88);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(1.0, 0.5,0.89);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(1.5, 0.5,0.90);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(2.0, 0.5,0.91);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(2.5, 0.5,0.92);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);

disp('PRESS ANY KEY TO FINISH COOKING THE PIZZA - PHASE 6...');
pause;

%% PHASE 6 - PIZZA COOKED, EXIT OVEN 

disp('PIZZA FINISHED COOKING')
Brick2Tr= transl(2.5, 0.5,0.92);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(2.0, 0.5,0.91);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(1.5, 0.5,0.90);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(1.0, 0.5,0.89);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(0.5, 0.5,0.88);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);
Brick2Tr = transl(0, 0.5,0.87);
Brick_2 = ImportPly('PBase.ply', Brick2Tr);

disp('PRESS ANY KEY FOR ROBOT TO PICK UP THE PIZZA - PHASE 7...');
pause;

%% PHASE 7 - PIZZA READY, PUT IT ON THE TABLE 

disp('PICKING UP PIZZA')
T11= transl(0,0.5,0.87)*trotx(-pi)*trotz(pi);
T12 = transl(0,0.5,0.90)*trotx(-3*pi/2);
%T11 = transl(0, 0.5,0.87)*trotx(-pi)*trotz(pi);
%T12 = Brick2Tr*trotx(pi)*trotz(-pi);
%transl(0, 0.5,0.87)
%*trotx(-3*pi/2);
Movement7 = [T11,T12]
kino.Move(robot, Movement7,[]);

T13 = transl(-1, 1.5, 0.83);
T14 = transl(-1, 1.5, 1.1)*trotx(-pi/2);
Movement8 = [T13,T14]
kino.Move(robot,Movement8,Brick_2);


disp('BON APPETIT');










 




