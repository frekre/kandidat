function [mean_energy] = avg_energy(SPEC, dt, df, NN)
%UNTITLED5 Summary of this function goes here
%   Detailed explanation goes here
mean_energy = 0; 
for i=1:NN
    mean_energy = mean_energy + energy_of_square(SPEC, dt, df, i);
    %funkar nog ej? 
end
mean_energy = mean_energy/NN;
end

