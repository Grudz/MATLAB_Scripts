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

display(simplify(T0_T));