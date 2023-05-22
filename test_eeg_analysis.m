
%testfil för att testa eeganalysis-funktionen med olika inputvärden.
%--------INPUTS---------
%DATA:
%load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%CHANNELS from left and right side:
channels1 = findChannels(data, {'FT7', 'FC5', 'T7', 'C5', 'TP7', 'CP5'});
channels2 = findChannels(data, {'FC6', 'FT8', 'C6', 'T8', 'CP6', 'TP8'});

%TRIALINFO
trialside = 2; % 1 for left, 2 for right (funktionen hittar S1 och S2 internt)
trialnum = 6; % which trial (den här är knas då man inte vet vilket trila man vill kolla på?)

%PARAMETERS for analysis:
filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8; %the signal is downsampled with this factor.

%RESULTS:
[mean_energy_1, mean_energy_2, z1, y1, x1, z2, y2, x2] = eeganalysis(data, channels1, channels2, trialside, trialnum, filterfrequency, lambda, FFTL);


