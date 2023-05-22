function [vS1, hS1, vSRS1, hSRS1, vS2, hS2, vSRS2, hSRS2] = resultmaker(data, channel1, channel2)
%RESULTMAKER plots the result for S and SRS of both left and right side
% of subject and chosen channels
%the axis and title is
% data: subject
%channel1: cell vector of chosen channels for side 1
%channel2: cell vector of chosen channels for side 2

channels1 = findChannels(data, channel1);
channels2 = findChannels(data, channel2);


filterfrequency = 2; %in hertz
lambda = 8; %gaussian window parameter
FFTL = 1024; %signal length
downsample = 8;
trialside = 1;

[vS1, hS1, vSRS1, hSRS1, Sdiff1, SRSdiff1, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);
trialside = 2;
[vS2, hS2, vSRS2, hSRS2, Sdiff2, SRSdiff2, TI, FI] = eegstat(data,channels1,channels2,trialside,filterfrequency,lambda,FFTL,downsample);


end

