function [] = plotEEG(xvalues, y_vector, titel)
% Simple function to plot EEG

figure
plot(xvalues, y_vector)
xlabel('Tid (s)')
ylabel('Spänning (mV)')
title(titel)
end

