% Pre-Lab 3 

clc;
close;

mdl_puma560;
p560.display;
T = transl(0.584, 0.004, 0.013);
T2 = rpy2tr(-1.5708, -0.872665, -0.349066);
PosT = T2*T;
display(PosT);

JPos1 = p560.ikine6s(PosT, 'lun');
JPos2 = p560.ikine6s(PosT, 'luf');
JPos3 = p560.ikine6s(PosT, 'rdn');
JPos4 = p560.ikine6s(PosT, 'rdf');
JPos5 = p560.ikine6s(PosT, 'ldn');
JPos6 = p560.ikine6s(PosT, 'ldf');
JPos7 = p560.ikine6s(PosT, 'run');
JPos8 = p560.ikine6s(PosT, 'ruf');

JPos = [JPos1; JPos2; JPos3; JPos4; JPos5; JPos6; JPos7; JPos8;];
JPosD = JPos * 180/pi;
display(JPosD);

%p560.plot(JPos8);

p560.plot(JPos, 'delay', 1);







