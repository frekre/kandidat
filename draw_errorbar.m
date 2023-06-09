function [] = draw_errorbar(vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2, heading)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here


vS1mean = mean(vS1(:,4));
vS1std = std(vS1(:,4));

hS1mean = mean(hS1(:,4));
hS1std = std(hS1(:,4));

vSRS1mean = mean(vSRS1(:,4));
vSRS1std = std(vSRS1(:,4));

hSRS1mean = mean(hSRS1(:,4));
hSRS1std = std(hSRS1(:,4));



vS2mean = mean(vS2(:,4));
vS2std = std(vS2(:,4));

hS2mean = mean(hS2(:,4));
hS2std = std(hS2(:,4));

vSRS2mean = mean(vSRS2(:,4));
vSRS2std = std(vSRS2(:,4));

hSRS2mean = mean(hSRS2(:,4));
hSRS2std = std(hSRS2(:,4));

figure
x = [1 2 4 5 8 9 11 12];
y = [vS1mean, hS1mean, vSRS1mean, hSRS1mean, vS2mean, hS2mean, vSRS2mean, hSRS2mean];
err = [vS1std, hS1std, vSRS1std, hSRS1std, vS2std, hS2std, vSRS2std, hSRS2std];

e = errorbar(x,y,err, "o");
e.Marker = '*';


axis([0 13 -150000 450000])
ylabel('energy');
sgtitle(heading);
end

