function [mean_energy] = avg_energy(SPEC, dt, df, NN, x, y)
%AVG_ENERGY sums up the average energy over trials.
%SPEC: spectrogram
%dt: +- in time around max
%df: +- in frequency around max.point
%NN: number of realisation / trials
%x: coordinate for middle point time s
%y: y cord for middle point frequency hertz

if nargin<5
    mean_energy = 0;
    for i=1:NN
        mean_energy = mean_energy + energy_of_square(SPEC, dt, df, i);
    end
    mean_energy = mean_energy/NN;
else
    mean_energy = 0;
    for i=1:NN
        mean_energy = mean_energy + energy_of_square(SPEC, dt, df, i, x, y);
    end
    mean_energy = mean_energy/NN;
end

end

