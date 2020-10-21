EnvironmentGen();
robot1base = [0.2, 1.5, 0.83];
BBQTr = transl(robot1base(1)+0.8, robot1base(2) -0.1, 1)*troty(-pi);
TomatoTr = transl(robot1base(1)+0.8, 1.7, 1)*troty(-pi);
pizzaPanTr = transl(0, 0.5, 0.87);

qkino = zeros(1, 6); 
robot = kino; %Initializing Robot 1
hold on;
robot.model.base = transl(robot1base)*trotz(pi);
robot.model.animate(qkino); 

BBQ_BOTTLE = ImportPly('IngBottle.ply', BBQTr);
TOMATO_BOTTLE = ImportPly('IngBottle2.ply', TomatoTr);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);



n = input("FOR BBQ BASE ENTER 1 // FOR TOMATO BASE ENTER 2: ")

switch n 
    case 1 
        disp( "YOU HAVE SELECTED BBQ BASE");
        disp( "APPLYING SAUCE NOW");

        %% PHASE 1 MOVING FIRST SAUCE BOTTLE To Pizza
        camlight;

        Sauce1Movement1 = transl(BBQTr(1,4), BBQTr(2,4), 0.95);
        %*trotx(-pi)*trotz(pi);
        Sauce1Movement2 = BBQTr*trotx(pi)*trotz(-pi);
        Sauce1Movement = [Sauce1Movement1,Sauce1Movement2];
        kino.Move(robot, Sauce1Movement, [] );


        T2 = transl(0,0.5,1.1);
        T3 = transl(0,0.5,1.1)*trotx(-3*pi/2);
        Sauce1Movement = [T2,T3];
        kino.Move(robot, Sauce1Movement, BBQ_BOTTLE );

        disp('SAUCE APPLIED...')
        disp('PRESS ANY KEY TO RESET ROBOT ARM - PHASE 2...');
        pause;

        %% PHASE 2 - RESET 
 
        T4= transl(0.5, 0.5,1.1);
        T41= transl(1, 1.4,1)*trotx(pi/2);

        Sauce1Movement = [T2,T4,T41];
        kino.Move(robot, Sauce1Movement, BBQ_BOTTLE );

        T5= transl(0.2, 0.4,0.95)

        RESETMovement = [T5];

        kino.Move(robot, RESETMovement, [] );
       
        
       
    
    case 2 
       camlight;
       disp( "YOU HAVE SELECTED TOMATO BASE");
       disp( "APPLYING SAUCE NOW");

        %% PHASE 3 - SAUCE BOTTLE 2 
        Movement1 = transl(TomatoTr(1,4), TomatoTr(1,4), 0.95);
        Movement2Tr = TomatoTr*trotx(pi)*trotz(-pi);
        Movement = [Movement1,Movement2Tr];
        kino.Move(robot, Movement, [] );

        T6 = transl(BBQTr(1,4), BBQTr(2,4), 0.95);
        T7 = transl(0,0.5,1.1);
        T8 = transl(0,0.5,1.1)*trotx(-3*pi/2);
        Sauce2Movement = [T6,T7,T8];
        kino.Move(robot, Sauce2Movement, TOMATO_BOTTLE);


        disp('PRESS ANY KEY TO RESET ROBOT ARM - PHASE 4...');
        pause;
        %% PHASE 4 - RESET 
 
        T4= transl(0.5, 0.5,1.1);
        T41= transl(1, 1.7,1.0)*trotx(pi/2);

        Sauce2Movement = [T2,T4,T41];
        kino.Move(robot, Sauce2Movement, TOMATO_BOTTLE );
        
        T6 = transl(BBQTr(1,4), BBQTr(2,4), 0.95);
        T5= transl(0.2, 0.4,0.95)
        RESETMovement = [T6,T5];

        kino.Move(robot, RESETMovement, [] );
        
    otherwise 
        
        disp("PLEASE CHOOSE FROM THE OPTIONS, THANK YOU...")
        
        
end

%% PHASE 5 - COOKING PIZZA 

disp('BASE SELECTED, COOKING PIZZA NOW')
camlight ;

pizzaPanTr= transl(0.5, 0.5,0.90);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(1.0, 0.5,0.93);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(1.5, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(2.0, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(2.5, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);

disp('PRESS ANY KEY TO FINISH COOKING THE PIZZA - PHASE 6...');
pause;

%% PHASE 6 - PIZZA COOKED, EXIT OVEN 
camlight;
disp('PIZZA FINISHED COOKING')
pizzaPanTr= transl(2.5, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(2.0, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(1.5, 0.5,0.95);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(1.0, 0.5,0.93);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(0.5, 0.5,0.92);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);
pizzaPanTr = transl(0, 0.5,0.90);
pizzaPan = ImportPly('PBase.ply', pizzaPanTr);

disp('PRESS ANY KEY FOR ROBOT TO PICK UP THE PIZZA - PHASE 7...');
pause;

%% PHASE 7 - PIZZA READY, PUT IT ON THE TABLE 

disp('PICKING UP PIZZA')
T11= transl(0,0.5,0.87);
T12 = transl(0,0.5,0.90)*trotx(-3*pi/2);
Movement7 = [T11,T12]
kino.Move(robot, Movement7,[]);


T14 = transl(-1, 1.5, 0.90)*trotx(-3*pi/2);
Movement8 = [T14]
kino.Move(robot,Movement8,pizzaPan);


disp('BON APPETIT');










 




