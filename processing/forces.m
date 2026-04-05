function T = forces(C, Sx, Sy, X, Y, L)
    A = a(C, Sx, Sy, X, Y);
    % T = -A^-1(L)
    T = A \ (-L);
end