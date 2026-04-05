% geometry of three joint truss, the triangle (the first test problem)
%we will probably change later but this is just for testing for now 
X = [0 2 1];
Y = [0 0 1x];
C = [1 1 0;
     1 0 1;
     0 1 1];
Sx = [1 0 0;
      0 0 0;
      0 0 0];

Sy = [0 1 0;
      0 0 1;
      0 0 0];

L = [0; 0; 0; 0; 0; -10];

member_calculations = calculations(C, X, Y)
disp(member_calculations)
A = a(C, Sx, Sy, X, Y);
disp('A = ')
disp(A)