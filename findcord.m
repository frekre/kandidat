function [ZmaxCol, ZmaxRow, Zmax] = findcord(SPEC, realisation)
%hjälpfunktion för att hittaindex i matris för x och y; 
% zmaxcol --> x (tid ) zmaxrow --> frekvens y 

Z= SPEC(:,:,realisation);
Zmax = max(Z(:));

[Zmax,Idx] = max(Z(:));
[ZmaxRow,ZmaxCol] = ind2sub(size(Z), Idx);

end

