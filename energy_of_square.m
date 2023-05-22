function [energy] = energy_of_square(SPEC, dt, df, realisation, x, y)
%energy of square sums up the energy within a square of a maximum point of
%the input spectogram SPEC.
%dt och df är hur många sampel runt mittpunkt vi söker i x och y led.
%realisation är vilken realisation man summerar.
%x och y är mittpunkten man vill utgå ifrån i tid och frekvens.

Fst = size(SPEC, 2)/9;
Fsf = size(SPEC, 1)/31.2167;

if nargin<5
    [x, y] = findcord(SPEC, realisation);
end
if nargin>5
    x = round((x+2)*Fst); %man skriver in och utgår från -2 men den utgår från noll.
    y = round(y*Fsf);
end


xspan = x-dt:1:x+dt;
yspan = y-df:1:y+df;

%ta bort negativa index och för höga index
if x<=dt
    xspan = 1:1:x+dt;
end
if (x+dt) > size(SPEC,2)
    xspan= x-dt:1:size(SPEC,2);
end
if (x+dt) > size(SPEC,2) && x<dt
    xspan = 1:1:size(SPEC,2);
end

if y<=df
    yspan = 1:1:y+df;
end

if (y+df) > size(SPEC,1)
    yspan= y-df:1:size(SPEC,1);
end

if (y+df) > size(SPEC,1) && y<df
    yspan = 1:1:size(SPEC,1);
end

A = SPEC(yspan, xspan, realisation);

energy = sum(sum(A));

end

