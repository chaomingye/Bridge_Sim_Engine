%a matrix

function A = a(C, Sx, Sy, X, Y)
    %find num of joints
    J = length(X);
    M = size(C,2);
    % get member info like direction and magnitudes 
    calcmem = calculations(C, X, Y);
    mj = calcmem.mj;
    x = calcmem.x_dir;
    y = calcmem.y_dir;

    %matrix should be 2J rows and M+3 columns, last three columns are Sx
    %and Sy (from document)
    A = zeros(2*J, M+3);
    for m = 1:M
        %gets joints connected to m
        j1 = mj(m,1);
        j2 = mj(m,2);
    % mem force for x and y members
        A(j1,m) = x(m);
        %opposite but equal forces
        A(j2,m) = -1*x(m);
        A(J+j1,m) = y(m);
        A(J+j2,m) = -1*y(m);
    end
    % sup forces
    for j = 1:J
        %1 if there is a x reaction force (from our support matrix)
        A(j,M+1)=Sx(j,1);
        A(j,M+2)=Sx(j,2);
        A(j,M+3)=Sx(j,3);
        %reaction forces for y rows 
        A(J+j,M+1) = Sy(j,1);
        A(J+j,M+2) = Sy(j,2);
        A(J+j,M+3) = Sy(j,3);
    end
end

