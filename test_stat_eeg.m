% Kladd för att testa lagra värden i vektor

%CHANNELS from left and right side:
channels1 = findChannels(data, {'FT7', 'FC5', 'T7', 'C5', 'TP7', 'CP5'});
channels2 = findChannels(data, {'FC6', 'FT8', 'C6', 'T8', 'CP6', 'TP8'});

filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;


[S1, S2] = findS1S2(data);

no1 = length(S1);
no2 = length(S2);

res = zeros(8,no1);


% Loopar igenom energi hämtas från S och den har redan loopat igenom alla
% trials. blir kontraproduktivt....
for i = 1:10
    trialnum = i;
    trialside = 1;
    
    [mean_energy_1, mean_energy_2, z1, y1, x1, z2, y2, x2] = eegstat(data, channels1, channels2, trialside, trialnum, filterfrequency, lambda, FFTL);
    
    res(1,i) = mean_energy_1;
    res(2,i) = mean_energy_2;
    res(3,i) = z1;
    res(4,i) = y1;
    res(5,i) = x1;
    res(6,i) = z2;
    res(7,i) = y2;
    res(8,i) = x2;
    
end
