function [Zmax, y_cord, x_cord] = findmax(SPEC, TI, FI)
%finding the maximum on the input spectogram, zmax, xcord an d ycord. 

Z= SPEC(:,:,1);
Zmax = max(Z(:));

[Zmax,Idx] = max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

x_cord = TI(ZmaxCol);
y_cord =FI(ZmaxRow);

end

