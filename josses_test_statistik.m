%CHANNELS from left and right side:
channels1 = findChannels(data, {'FT7'});
channels2 = findChannels(data, {'FC6'});

filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS, hS, vSRS, hSRS] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);
