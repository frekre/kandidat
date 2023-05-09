function [Zmax, y_cord, x_cord] = findmax(SPEC, TI, FI)
%finding the maximum on the input spectogram, zmax, xcord an d ycord. 

Fs = 62.55556;
tmin = round(2*Fs);
tmax = round(6*Fs);

Z= SPEC(:,tmin:tmax,1);
Zmax = max(Z(:));

[Zmax,Idx] = max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

x_cord = TI(ZmaxCol);
y_cord =FI(ZmaxRow);

end

