function [] = plotEEG(xvalues, y_vector, titel)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here

figure
plot(xvalues, y_vector)
xlabel('Tid (s)')
ylabel('Spänning (mV)')
title(titel)
end

