%we will probably split these into seperate files but i put them all in one for now


%basically we give location X and Y, where its connected C, the support matrix Sx and Sy, and where the load is applied L
%they give us some constants in the paper




%{
after we give X,Y,C,Sx,Sy,and L
our code should:
solve equilibrium equation like member forces and reaction forces 
use member lengths + compress forces to calculate buckling strength using members
find which member will fail first by calculating maximum load and critical member
then calculate cost
%}

%member calculations (position of joints etc) 
function calcmem = calculations(C, X, Y)
      M = size(C, 2);
      mj = zeros(M, 2);

    %find joints
      for m = 1:M
          %find rows that = 1 which means there is a joint there
          joints = find(C(:, m) == 1);
          mj(m,1) = joints(1);
          mj(m,2) = joints(2);

      end

      magn = zeros(M, 1);
      x = zeros(M, 1);
      y = zeros(M, 1);
      %calculate direciton  components by diving by magnitude
      %basically getting unit vector
      for m = 1:M
          j1 = mj(m, 1);
          j2 = mj(m, 2);
          magn(m) = sqrt((X(j2) - X(j1))^2 + (Y(j2) - Y(j1))^2);
          x(m) = (X(j2) - X(j1)) / (magn(m));
          y(m) = (Y(j2) - Y(j1)) / (magn(m));
      end
      calcmem.mj = mj;
      calcmem.magn = magn;
      calcmem.x_dir = x;
      calcmem.y_dir = y;
end


