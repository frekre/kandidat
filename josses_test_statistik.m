%Program för statistik: 

close all
clear all

load('/Users/fremjaekre/Documents/MATLAB/Kandidat/neuro_data/dataSubj10.mat', 'data')

%CHANNELS from left and right side:
channels1 = findChannels(data, {'C3'});
channels2 = findChannels(data, {'C4'});

filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS, hS, vSRS, hSRS] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);

%-------statistiska värden-----------
%vänster kanaler från sida 1
vSmean = mean(vS(:,1))
vSstd = std(vS(:,1))
vSRSmean = mean(vSRS(:,1))
vSRSstd = std(vSRS(:,1))

% figure
% normplot(vS(:,1));

%höger kanaler från sida 2
hSmean = mean(hS(:,1))
hSstd = std(hS(:,1))
hSRSmean = mean(hSRS(:,1))
hSRSstd = std(hSRS(:,1))

%energi i rutor: 

%vänster kanaler från sida 1
vSmeansq = mean(vS(:,4))
vSstdsq = std(vS(:,4))
vSRSmeansq = mean(vSRS(:,4))
vSRSstdsq = std(vSRS(:,4))

%höger kanaler från sida 2
hSmeansq = mean(hS(:,4))
hSstdsq = std(hS(:,4))
hSRSmeansq = mean(hSRS(:,4))
hSRSstdsq = std(hSRS(:,4))

%%
figure
subplot(2,1,1)
normplot(vS(:,2));
subtitle('Normplot av frekvens för max från S')
subplot(2,1,2)
normplot(vSRS(:,2));
subtitle('Normplot av frekvens för max från SRS')
sgtitle('Stimuli i vänster öra, vänstra kanaler')
%% Fyra olika i ett fönster

figure
subplot(2,2,1)
histogram(vS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - vänster')
subplot(2,2,3)
histogram(vSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Normplot av energi i ruta från SRS - vänster')
sgtitle('Stimuli i vänster öra')   

subplot(2,2,2)
histogram(hS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - höger')
subplot(2,2,4)
histogram(hSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Normplot av energi i ruta från SRS - höger')
%sgtitle('Stimuli i vänster öra, högra kanaler')  
%% försök få fler i en!

figure
subplot(2,2,1)
histogram(vS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - vänster')
subplot(2,2,3)
histogram(vSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Normplot av energi i ruta från SRS - vänster')
sgtitle('Stimuli i vänster öra')   

subplot(2,2,2)
histogram(hS(:,4), 'NumBins', 70)
axis([0 15*10^5 0 9])
subtitle('Histogram av energi i ruta från S - höger')
subplot(2,2,4)
histogram(hSRS(:,4), 'NumBins', 70);
axis([0 15*10^5 0 9])
subtitle('Normplot av energi i ruta från SRS - höger')
% Set the title
% xlabel('Values')                    % Set the x-axis label
% ylabel('Frequency')                 % Set the y-axis label


