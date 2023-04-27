function [ZmaxCol, ZmaxRow, Zmax] = findcord(SPEC, realisation)
%hjälpfunktion för att hittaindex i matris för x och y; 
% zmaxcol --> x (tid ) zmaxrow --> frekvens y 
Fs = 62.55556;
tmin = round(2*Fs);
tmax = round(6*Fs);

Z= SPEC(:,tmin:tmax,realisation);
Zmax = max(Z(:));

[Zmax,Idx] = max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

end

