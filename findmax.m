function [Zmax, y_cord, x_cord] = findmax(SPEC, TI, FI)
%finding the maximum on the input spectogram, zmax, xcord and ycord. 

Fs = 62.55556;
tmin = round(2.6*Fs);
tmax = round(4.6*Fs);

Z= SPEC(:,tmin:tmax,1); % begränsar tidsfönstret till 0.6-2.6 sekunder

[Zmax,Idx] = max(Z(:));

[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

 x_cord = TI(ZmaxCol) + 0.6; %fixar tidsindex
 y_cord = FI(ZmaxRow);

end

