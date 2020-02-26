clc;% Clears terminal

syms T1 T2 T3 T1_ T2_ T3_ L1 L2 L3; %Theta + Length Variables

% Rotation Matricies, note the 4th is identity
R1_0 = [cos(T1) -sin(T1) 0; sin(T1) cos(T1) 0; 0 0 1;];
R2_1 = [cos(T1) -sin(T2) 0; 0 0 -1; sin(T2) cos(T2) 0;];
R3_2 = [cos(T3) -sin(T3) 0; sin(T3) cos(T3) 0; 0 0 1;];

w4_4 = [0; 0; T3_;];
v4_4 = [0; L3*T3_; -T1_* L1 + L2*(cos(T2) * T1_ - T2_);];
R0_4 = R1_0*R2_1*R3_2;

w0_4 = R0_4*w4_4;

disp('Rotational velocity at frame 0 wrt frame 4:');
fprintf('\n');
disp(w0_4);

v0_4 = R0_4*v4_4;

disp('Liner velocity at frame 0 wrt frame 4:');
fprintf('\n');
disp(v0_4);
