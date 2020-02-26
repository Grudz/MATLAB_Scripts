% Group 13 Matlab Script for inverse kinematics - Problem 2
% Members: Benjamin Grudzien, Miguel Jaimes, Merlin Loetzner

clc; % Clears Terminal and closes everything
close all;

%-------Inverse Kinematics FUNCTION INPUT-------%
x = 10; % X coordinate, 0 to 15
y = 5; % Y coordinate, 0 to 15
O = 2; % Orientation in radians, 0 to 1

% Inverse Kinematic Equations, T = Theta (From book, section 4.4)
T1 = atan2(y, x) + acos((x^2+y^2+100-25)/(2*10*(x^2+y^2)^.5)); % L1 = 10, L2 = 5
w = (x^2+y^2-100-25)/(2*10*(x^2+y^2)^.5); % Shortcut for T2
T2 = atan2(((1-w^2)^.5),w);
T3 = O-T2-T1;

%-------Inverse Kinematics FUNCTION OUTPUT-------%
msgbox(num2str(T1), 'T1'); % Message box output
msgbox(num2str(T2), 'T2');
msgbox(num2str(T3), 'T3');
disp(T1); % Terminal output
disp(T2);
disp(T3);

%-------Cartesian Path FUNCTION-------%
%  -> My cartesian path is drawn on a piece of paper attached to this doc

% Increment 1
x1 = (0:0.1:14.4); % start:sampling rate:end
y1 = (15:0.1:5);
O1 = 2; % Tool is straight out

% Increment 2
x1 = (14.4:0.1:15);
y2 = (5:0.1:0);
O2 = 2;

plot(x1,y1, 'b');
hold on;
plot (x2, y2, 'r');

% Group 13 Matlab Script for inverse kinematics - Problem 1
% Members: Benjamin Grudzien, Miguel Jaimes, Merlin Loetzner

clc;% Clears terminal

syms T1 T2 T3; %Theta angle variables

% Test Symbols for experimenting
syms r11 r12 r13 r21 r22 r23 r31 r32 r33 px py pz;
T_sym = [r11 r12 r13 px; r21 r22 r23 py; r31 r32 r33 pz; 0 0 0 1];

% A1 through AT
T0_1 = [cos(T1) -sin(T1) 0 0; sin(T1) cos(T2) 0 0; 0 0 1 0; 0 0 0 1;];
T1_2 = [cos(T2) -sin(T2) 0 15; 0 0 -1 0; sin(T2) cos(T2) 0 0;0 0 0 1;];
T2_3 = [cos(T3) -sin(T3) 0 10; sin(T3) cos(T3) 0 0; 0 0 1 0; 0 0 0 1;];
T3_T = [ 1 0 0 3; 0 1 0 0; 0 0 1 0; 0 0 0 1;];
T0_T = T0_1*T1_2*T2_3*T3_T;

% Inverses of A1 through A3
T0_1_i = inv(T0_1);
T0_2_i = inv(T1_2);
T0_3_i = inv(T2_3);

%Random Test
%T_left = T0_1_i*T_sym;
%T_right = T1_2*T2_3*T3_T;

% Step 1
T_left = simplify(T0_1_i*T0_T);
T_right = T0_1_i*T0_1*T1_2*T2_3*T3_T;

disp(T_left);
disp(T_right);

% Step 2
T_left_step2 = T0_2_i*T_left;
T_right_step2 = T2_3*T3_T;

disp(T_left_step2);
disp(T_right_step2);

% Step 3
T_left_step3 = T0_3_i*T_left_step2;
T_right_step3 = T3_T;
 
disp(T_left_step3);
disp(T_right_step3);