clc;% Clears terminal

syms T1 T2 T3 fx fy fz L1 L2 L3; %Theta + Length Variables

% Rotation Matricies, note the 4th is identity
R1_0 = [cos(T1) sin(T1) 0; -sin(T1) cos(T1) 0; 0 0 1;];
R2_1 = [cos(T2) 0 sin(T2); -sin(T2) 0 cos(T2); 0 -1 0;];
R3_2 = [cos(T3) sin(T3) 0; -sin(T3) cos(T3) 0; 0 0 1;];

% Moment for frame 3
n3_3 = [0; -L3*fz; L3*fy;];

% Force/moment for frame 2 (Answer's handwrittern)
F2_2 = [cos(T3)*fx + sin(T3)*fy; -sin(T3)*fx + cos(T3)*fy; fz;]; 
n2_2 = R3_2*n3_3 + cross([L2; 0; 0;], F2_2);

% Force/moment for frame 1
F1_1 = R2_1* F2_2;
fprintf('Force in frame 1:\n');
disp(F1_1)
n1_1 = R2_1*n2_2 + cross([L1; 0; 0;], F1_1);
fprintf('Moment in frame 1:\n');
disp(n1_1);

% Torques
Torque_1 = transpose(n1_1)*[0; 0; 1;];
Torque_2 = transpose(n2_2)*[0; -1; 0;];
Torque_3 = transpose(n3_3)*[0; 0; 1;];

fprintf('Torque 1:\n');
disp(simplify(Torque_1));
fprintf('Torque 2:\n');
disp(Torque_2);
fprintf('Torque 3:\n');
disp(Torque_3);

