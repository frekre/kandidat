%CHANNELS from left and right side:
channels1 = findChannels(data, {'C3'});
channels2 = findChannels(data, {'C4'});

filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS, hS, vSRS, hSRS] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);

%% energi
%vänster kanaler från sida 1
vSmean = mean(vS(:,1))
vSstd = std(vS(:,1))
vSRSmean = mean(vSRS(:,1))
vSRSstd = std(vSRS(:,1))

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
%% testar findmax
